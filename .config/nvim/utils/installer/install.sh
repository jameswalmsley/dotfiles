#!/usr/bin/env bash

set -eo pipefail

#Set branch to master unless specified by the user
declare LV_BRANCH="${LV_BRANCH:-"rolling"}"
declare -r LV_REMOTE="${LV_REMOTE:-lunarvim/lunarvim.git}"
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/lunarvim"}"
declare -r LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/lvim"}"
# TODO: Use a dedicated cache directory #1256
declare -r LUNARVIM_CACHE_DIR="$XDG_CACHE_HOME/nvim"
declare -r LUNARVIM_PACK_DIR="$LUNARVIM_RUNTIME_DIR/site/pack"

declare -a __lvim_dirs=(
  "$LUNARVIM_CONFIG_DIR"
  "$LUNARVIM_RUNTIME_DIR"
  "$LUNARVIM_CACHE_DIR"
)

declare -a __npm_deps=(
  "neovim"
  "tree-sitter-cli"
)

declare -a __pip_deps=(
  "pynvim"
)

function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help    Print this help message"
  echo "    -y, --yes     Yes for all choices (Install NodeJS, Python, Rust dependencies)"
  echo "    --overwrite   Overwrite previous lvim configuration"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -y | --yes)
        ARGS_INSTALL_NONINTERACTIVE="y"
        ;;
      --overwrite)
        ARGS_OVERWRITE="y"
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function main() {
  parse_arguments "$@"

  cat <<'EOF'

      88\                                                   88\
      88 |                                                  \__|
      88 |88\   88\ 888888$\   888888\   888888\ 88\    88\ 88\ 888888\8888\
      88 |88 |  88 |88  __88\  \____88\ 88  __88\\88\  88  |88 |88  _88  _88\
      88 |88 |  88 |88 |  88 | 888888$ |88 |  \__|\88\88  / 88 |88 / 88 / 88 |
      88 |88 |  88 |88 |  88 |88  __88 |88 |       \88$  /  88 |88 | 88 | 88 |
      88 |\888888  |88 |  88 |\888888$ |88 |        \$  /   88 |88 | 88 | 88 |
      \__| \______/ \__|  \__| \_______|\__|         \_/    \__|\__| \__| \__|

EOF

  __add_separator "80"

  echo "Detecting platform for managing any additional neovim dependencies"
  detect_platform

  if [ -n "$GITHUB_ACTIONS" ]; then
    LV_BRANCH="${GITHUB_REF##*/}"
    install_packer
    setup_lvim
    exit 0
  fi

  check_system_deps

  __add_separator "80"

  if [ -z "$ARGS_INSTALL_NONINTERACTIVE" ]; then
    echo "Would you like to install lunarvim's NodeJS dependencies?"
    read -p "[y]es or [n]o (default: no) : " -r answer
    [ "$answer" != "${answer#[Yy]}" ] && install_nodejs_deps

    echo "Would you like to install lunarvim's Python dependencies?"
    read -p "[y]es or [n]o (default: no) : " -r answer
    [ "$answer" != "${answer#[Yy]}" ] && install_python_deps

    echo "Would you like to install lunarvim's Rust dependencies?"
    read -p "[y]es or [n]o (default: no) : " -r answer
    [ "$answer" != "${answer#[Yy]}" ] && install_rust_deps
  else
    install_nodejs_deps
    install_python_deps
    install_rust_deps
  fi

  __add_separator "80"

  echo "Backing up old LunarVim configuration"
  backup_old_config

  __add_separator "80"

  if [ -n "$ARGS_OVERWRITE" ]; then
    echo "!!Warning!! -> Removing all lunarvim related config \
      because of the --overwrite flag"
    if [ -z "$ARGS_INSTALL_NONINTERACTIVE" ]; then
      read -p "Would you like to continue? [y]es or [n]o : " -r answer
      [ "$answer" == "${answer#[Yy]}" ] && exit 1
    fi
    for dir in "${__lvim_dirs[@]}"; do
      [ -d "$dir" ] && rm -rf "$dir"
    done
  fi

  install_packer

  __add_separator "80"

  if [ -e "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" ]; then
    echo "Updating LunarVim"
    update_lvim
  else
    clone_lvim
    setup_lvim
  fi

  __add_separator "80"
}

function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge install -y"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

function check_system_deps() {
  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
}

function __install_nodejs_deps_npm() {
  echo "Installing node modules with npm.."
  for dep in "${__npm_deps[@]}"; do
    if ! npm ls -g "$dep" &>/dev/null; then
      printf "installing %s .." "$dep"
      npm install -g "$dep"
    fi
  done
  echo "All NodeJS dependencies are succesfully installed"
}

function __install_nodejs_deps_yarn() {
  echo "Installing node modules with yarn.."
  yarn global add "${__npm_deps[@]}"
  echo "All NodeJS dependencies are succesfully installed"
}

function install_nodejs_deps() {
  local -a pkg_managers=("yarn" "npm")
  for pkg_manager in "${pkg_managers[@]}"; do
    if command -v "$pkg_manager" &>/dev/null; then
      eval "__install_nodejs_deps_$pkg_manager"
      return
    fi
  done
  print_missing_dep_msg "${pkg_managers[@]}"
  exit 1
}

function install_python_deps() {
  echo "Verifying that pip is available.."
  if ! python3 -m ensurepip &>/dev/null; then
    if ! python3 -m pip --version &>/dev/null; then
      print_missing_dep_msg "pip"
      exit 1
    fi
  fi
  echo "Installing with pip.."
  for dep in "${__pip_deps[@]}"; do
    python3 -m pip install --user "$dep"
  done
  echo "All Python dependencies are succesfully installed"
}

function __attempt_to_install_with_cargo() {
  if command -v cargo &>/dev/null; then
    echo "Installing missing Rust dependency with cargo"
    cargo install "$1"
  else
    echo "[WARN]: Unable to find cargo. Make sure to install it to avoid any problems"
    exit 1
  fi
}

# we try to install the missing one with cargo even though it's unlikely to be found
function install_rust_deps() {
  local -a deps=("fd::fd-find" "rg::ripgrep")
  for dep in "${deps[@]}"; do
    if ! command -v "${dep%%::*}" &>/dev/null; then
      __attempt_to_install_with_cargo "${dep##*::}"
    fi
  done
  echo "All Rust dependencies are succesfully installed"
}

function backup_old_config() {
  for dir in "${__lvim_dirs[@]}"; do
    # we create an empty folder for subsequent commands \
    # that require an existing directory
    mkdir -p "$dir" "$dir.bak"
    touch "$dir/ignore"
    if command -v rsync &>/dev/null; then
      rsync --archive -hh --partial --progress --cvs-exclude \
        --modify-window=1 "$dir"/ "$dir.bak"
    else
      OS="$(uname -s)"
      case "$OS" in
        Linux)
          cp -r "$dir/"* "$dir.bak/."
          ;;
        Darwin)
          cp -R "$dir/"* "$dir.bak/."
          ;;
        *)
          echo "OS $OS is not currently supported."
          ;;
      esac
    fi
  done
  echo "Backup operation complete"
}

function install_packer() {
  if [ -e "$LUNARVIM_PACK_DIR/packer/start/packer.nvim" ]; then
    echo "Packer already installed"
  else
    if ! git clone --depth 1 "https://github.com/wbthomason/packer.nvim" \
      "$LUNARVIM_PACK_DIR/packer/start/packer.nvim"; then
      echo "Failed to clone Packer. Installation failed."
      exit 1
    fi
  fi
}

function clone_lvim() {
  echo "Cloning LunarVim configuration"
  if ! git clone --branch "$LV_BRANCH" \
    --depth 1 "https://github.com/${LV_REMOTE}" "$LUNARVIM_RUNTIME_DIR/lvim"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

function setup_shim() {
  if [ ! -d "$INSTALL_PREFIX/bin" ]; then
    mkdir -p "$INSTALL_PREFIX/bin"
  fi
  cat >"$INSTALL_PREFIX/bin/lvim" <<EOF
#!/bin/sh

export LUNARVIM_CONFIG_DIR="\${LUNARVIM_CONFIG_DIR:-$LUNARVIM_CONFIG_DIR}"
export LUNARVIM_RUNTIME_DIR="\${LUNARVIM_RUNTIME_DIR:-$LUNARVIM_RUNTIME_DIR}"

exec nvim -u "\$LUNARVIM_RUNTIME_DIR/lvim/init.lua" "\$@"
EOF
  chmod +x "$INSTALL_PREFIX/bin/lvim"
}

function remove_old_cache_files() {
  local packer_cache="$LUNARVIM_CONFIG_DIR/plugin/packer_compiled.lua"
  if [ -e "$packer_cache" ]; then
    echo "Removing old packer cache file"
    rm -f "$packer_cache"
  fi

  if [ -e "$LUNARVIM_CACHE_DIR/luacache" ] || [ -e "$LUNARVIM_CACHE_DIR/lvim_cache" ]; then
    echo "Removing old startup cache file"
    rm -f "$LUNARVIM_CACHE_DIR/{luacache,lvim_cache}"
  fi
}

function setup_lvim() {

  remove_old_cache_files

  echo "Installing LunarVim shim"

  setup_shim

  echo "Preparing Packer setup"

  cp "$LUNARVIM_RUNTIME_DIR/lvim/utils/installer/config.example-no-ts.lua" \
    "$LUNARVIM_CONFIG_DIR/config.lua"

  "$INSTALL_PREFIX/bin/lvim" --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'

  echo "Packer setup complete"

  cp "$LUNARVIM_RUNTIME_DIR/lvim/utils/installer/config.example.lua" "$LUNARVIM_CONFIG_DIR/config.lua"

  echo "Thank you for installing LunarVim!!"
  echo "You can start it by running: $INSTALL_PREFIX/bin/lvim"
  echo "Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]"
}

function update_lvim() {
  git -C "$LUNARVIM_RUNTIME_DIR/lvim" fetch --quiet
  if ! git -C "$LUNARVIM_RUNTIME_DIR/lvim" diff --quiet "@{upstream}"; then
    git -C "$LUNARVIM_RUNTIME_DIR/lvim" merge --ff-only --progress ||
      echo "Unable to guarantee data integrity while updating. Please do that manually instead." && exit 1
  fi
  echo "Clearing up old startup cache"
  "$INSTALL_PREFIX/bin/lvim" --headless +LvimCacheReset +q
  echo "Your LunarVim installation is now up to date!"
}

function __add_separator() {
  local DIV_WIDTH="$1"
  printf "%${DIV_WIDTH}s\n" ' ' | tr ' ' -
}

main "$@"
