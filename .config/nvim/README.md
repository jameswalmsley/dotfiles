```
   _..._                             
 .'   (_`.    _                         __     ___           
:  .      :  | |   _   _ _ __   __ _ _ _\ \   / (_)_ __ ___  
:)    ()  :  | |  | | | | '_ \ / _` | '__\ \ / /| | '_ ` _ \ 
`.   .   .'  | |__| |_| | | | | (_| | |   \ V / | | | | | | |
  `-...-'    |_____\__,_|_| |_|\__,_|_|    \_/  |_|_| |_| |_|
```


[![GitHub license](https://img.shields.io/github/license/ChristianChiarulli/LunarVim)](https://github.com/ChristianChiarulli/LunarVim/blob/master/LICENSE)
[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/ChristianChiarulli/lunarvim)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
<a href="https://patreon.com/chrisatmachine" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a>
<a href="https://twitter.com/intent/follow?screen_name=chrisatmachine"><img src="https://img.shields.io/twitter/follow/chrisatmachine?style=social&logo=twitter" alt="follow on Twitter"></a>

![LunarVim Demo](./utils/media/demo.png)

# Table of contents
- [Project Goals](#project-goals)
- [What's included?](#whats-included)
  - [Why do I want tree-sitter and LSP?](#why-do-i-want-tree-sitter-and-lsp)
- [Install In One Command!](#install-in-one-command)
  - [Get the latest version of Neovim](#get-the-latest-version-of-neovim)
- [Getting started](#getting-started)
  - [Home screen](#home-screen)
  - [Leader and Whichkey](#leader-and-whichkey)
  - [Important Configuration files](#important-configuration-files)
- [Clipboard Support](#clipboard-support)
- [LSP](#lsp)
- [Useful Programs](#useful-programs)
- [EFM server](#efm-server)
- [Formatters and Linters](#formatters-and-linters)
- [De-bugging](#de-bugging)
- [VSCodium](#vscodium)
- [Useful commands for troubleshooting](#useful-commands-for-troubleshooting)
- [TODO](#todo)

# Project Goals
*  This project aims to help one transition away from VSCode, and into a superior text editing experience. (Just making this clear)

* This is also a community project, if you would like to see support for a feature or [language](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) consider making a PR.

* This project will do it's best to include core features you would expect from a modern IDE, while making it easy to add or remove what the user wants.

# Global Install

To install globally:

```
git clone https://github.com/jameswalmsley/nvcode.git -b global-install nvcode.global
cd nvcode.global/utils/bin
sudo ./nvcode-upgrade.sh -g
```

This install a copy of the nvcode config into `/usr/local/share/nvcode/nvim`, and installs the nv,
starter script to `/usr/local/bin`

The script will use sudo to run nvim as the calling user to sync plugins to `~/.local/share/nvcode/data/nvim`.

It leaves nvim open, simply exit nvim when finished. (Couldn't get headless nvim to not quit early on packer).

Once completed you should be able to run nv without interfering with the main .config/nvim config.

NOTE.. This global install will use `.config/nvcode/nvim`

## Install In One Command!

# What's included?

LunarVim provides neovim configuration files that take advantage of tree-sitter and language server protocol. The configuration is written in lua. 

## Why do I want tree-sitter and LSP?

* Normally, an editor uses regular expression parsing for things like highlighting and checking the syntax of your file.  Each time you make a change, the editor must re-parse the entire file.  Tree-sitter, on the other hand, transforms text into a syntax tree.  Each time you make a change, only the parts of the code that change need to be parsed.  This greatly improves the speed of parsing. This can make a huge difference when editing large files.

* Neovim 0.5 including language server protocol means your editor can provide: code actions, completions, formatting, navigating to definitions, renaming, etc.  The language server only has to be written once and will work on any editor that supports LSP.  Any improvements made to the language server will immediately be used by all editors that support LSP.

# Install In One Command!

Make sure you have the newest version of Neovim. 

```bash
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)
```

After installation run `nvim` and then `:PackerInstall`

## Get the latest version of Neovim

Some operating systems package versions of Neovim 0.5.  You can install those or you can follow the steps below to compile from source.  Compiling from source is the recommended method.

First, get the dependencies. For distributions other than Ubuntu or Arch go [here](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)
```bash
#Ubuntu
sudo apt-get install gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential
#Arch
sudo pacman -S base-devel cmake unzip ninja tree-sitter
```

Download and compile Neovim
```bash
cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
```
or if you are on Arch you can get it from the AUR
```bash
yay -S neovim-git
```

# Getting started

## Home screen
The home screen is a plugin called dashboard.  It uses the Telescope plugin to find files or find words within files.  The home  screen provides a link to load saved Sessions.  The home screen links to the settings file located at this path: ~/.config/nvim/lv-settings.lua

## Leader and Whichkey
The default leader key is set to \<Space>.  Pressing it will also open up whichkey.  Whichkey will help you easily access many of the default keybindings.  

## Other key bindings
Other key bindings can be found in ~/.config/nvim/lua/keymappings.lua

If you already have a set of keybindings in vimscript that you prefer, source your vimscript file from ~/.config/nvim/init.lua  

Example:
```lua
vim.cmd('source ~/.config/nvim/vimscript/keymappings.vim')
```

Or you can translate your old bindings to lua and keep them in the provided keymappings file.  Follow the lua guide available [here](https://github.com/nanotee/nvim-lua-guide)

## Important Configuration files
| Path | Description |
|------|-------------|
|~/.config/nvim/lv-settings.lua      | The main settings file            |
|~/.config/nvim/lua/keymappings.lua  |  Key bindings           |
|~/.config/nvim/lua/plugins.lua      |  Add or remove plugins here           |

# Clipboard Support

- On Mac `pbcopy` should be built-in

- Ubuntu

    ```bash
    sudo apt install xclip
    ```

- Arch

    ```bash
    sudo pacman -S xclip
    ```

- WSL2

    Make sure ~/bin is in your path in this case.
    
    ```bash
    curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    chmod +x /tmp/win32yank.exe
    mv /tmp/win32yank.exe ~/bin
    ```

# LSP

To install a supported language server:

``` bash
  :LspInstall <your_language_server>
```

Most common languages should be supported out of the box, if yours is not I would welcome a PR

For a more in depth LSP support:
[link](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)

# Useful Programs

LunarVim depends on the following:

``` bash
ranger
ueberzug
ripgrep
pynvim
neovim-remote
```

# EFM server

In order for linters and formatters to work you will need to install
`efm-langserver`

```vim
:LspInstall efm
```

# Formatters and Linters

**Python**

``` bash
pip3 install --user flake8
pip3 install --user yapf
```

**Lua**

``` bash
luarocks install --server=https://luarocks.org/dev luaformatter
```

**Yaml, Json, Javascript, HTML, CSS**

``` bash
npm install -g prettier
```

**Markdown**

``` bash
pandoc
```

# De-bugging

To set up your particular debugger, look here:
[link](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

# VSCodium

I recommend you support Free/Libre versions if you plan to use VSCode:

- [VSCodium](https://vscodium.com/)

- Article to get you set up with VSCodium: [link](https://www.chrisatmachine.com/Neovim/22-vscodium-neovim/) 

After installing the [Neovim
extension](https://github.com/asvetliakov/vscode-neovim) in VSCode

I recommend using this alongside the VSCode
[which-key](https://github.com/VSpaceCode/vscode-which-key) extension

You will also need `settings.json` and `keybindings.json` which can be
found in utils/vscode\_config

Point the nvim path to your `nvim` binary

Point your `init.vim` path to:

``` vim
$HOME/.config/nvim/vimscript/lv-vscode/init.vim
```

# Useful commands for troubleshooting
Whether you plan on using LunarVim as is or as a base to configure your own neovim, the following commands may be useful.  Any command that includes the symbol ':' is meant to be typed as a command in neovim. Make sure you're in normal mode not insert mode. 

| Command | Description |
|------|-------------|
| :checkhealth | Check the health of your neovim install            |
| :checkhealth \<pluginname>  |  Check the health of a plugin |
| nvim -v |   checks your neovim version           |
| nvim -V | vebose output when running neovim.  Prints out every event |
| :PackerCompile | Must be run when you make plugin changes. (or, alternately run :PackerSync) |
| :PackerInstall  | Only install missing plugins|
| :PackerUpdate | Update and install plugins |
|:PackerClean | Remove any disabled or unused plugins |
|:PackerSync | Performs 'PackerClean' then 'PackerUpdate' |
|:PackerStatus | List the status of your plugins |
|:LspInstall \<language> | Install a language server for a specific programming language |
| :LspInfo | List the status of active and configured language servers|
|:LspStart \<language> |     Start the requested server name. Will only succesfully start if the command detects a root directory matching the current config. Pass autostart = false to your .setup{} call for a language server if you would like to launch clients solely with this command. Defaults to all servers matching current buffer filetype.  |
|:LspStop | Stops all buffer clients|
|:LspRestart | Restarts all buffer clients|
|:map | List keybindings |
|:nmap | List normal mode keybindings |
|:vmap | List visual mode keybindings |
|:imap | List insert mode keybindings |
|:verbose imap \<keybinding> | Print out what a particular keybinding is mapped to|
|:messages | Print error messages.  Useful when messages get cut off|
|:scriptnames | List all sourced files|


# TODO

**HIGH PRIORITY**

- Move user config into `config.lua` ts-comment string for react
- From here I will update for bug fixes and implement low priority
features when I have time
- different key to advance through snippets


**LOW PRIORITY**

- vim vsnips dir should be co-located with config
- list all binaries needed for formatters and linters (one day add in wiki)
- Implement what I can from this java config:
  [link](https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations)
  - better ui for code actions - formatting
  - setup junit tests for java
- look into emmet-ls
- vim ult test
- which-key all in lua
- what is `fzy`
- https://github.com/pwntester/octo.nvim
- configure surround
- Implement this for typescript https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
- look into tabnine


**PLUGIN BUGS**

REACT COMMENTING IS A NIGHTMARE (the filetype is just not recognized idk why)
