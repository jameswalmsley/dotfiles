#!/bin/bash

source nvcode-env.sh

PARAMS=""
while (( "$#" )); do
  case "$1" in
    -g|--global)
      GLOBAL=1
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

if [[ ! -v GLOBAL ]]; then
  user_environment
fi

cloneconfig() {
  echo "Cloning NVCode configuration"
  git clone https://github.com/jameswalmsley/nvcode.git -b global-install ${NVCODE_BASE}/nvim
  #mkdir -p ${NVCODE_BASE}
  #rsync -av /home/james/.config/nvim/* /usr/local/share/nvcode/nvim/
  sudo -S -u ${SUDO_USER} -i ${NVCODE_BASE}/nvim/utils/bin/nv -u ${NVCODE_BASE}/nvim/utils/init.lua --noplugin +PackerInstall
  cp ${NVCODE_BASE}/nvim/utils/bin/nv /usr/local/bin
}

upgrade_nvcode() {
  echo upgrading
  cd ${NVCODE_BASE}/nvim && git fetch && git reset --hard origin/global-install
  sudo -S -u ${SUDO_USER} -i ${NVCODE_BASE}/nvim/utils/bin/nv -u ${NVCODE_BASE}/nvim/utils/init.lua --noplugin +PackerSync
  cp ${NVCODE_BASE}/nvim/utils/bin/nv /usr/local/bin
}

install_nvcode() {
  echo installing
  cloneconfig
}
echo ${NVCODE_BASE}
[ -d "${NVCODE_BASE}" ] && upgrade_nvcode || install_nvcode

