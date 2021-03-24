![NVCode Logo](./utils/media/nvcode_logo.png)

![NVCode Demo](./utils/media/demo.png)

If you are looking for my old configs checkout the two snapshot branches
on this repo, there is one for CoC and one for Native LSP

## Install In One Command!

Make sure you have the newest version of Neovim

``` bash
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/nvim/master/utils/installer/install.sh)
```

After installation run `nvim` and then `:PackerInstall`

## Get the latest version of Neovim

``` bash
cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
```

## VSCode support

After installing the [Neovim
extension](https://github.com/asvetliakov/vscode-neovim) in VSCode

I recommend using this alongside the VSCode
[which-key](https://github.com/VSpaceCode/vscode-which-key) extension

You will also need `settings.json` and `keybindings.json` which can be
found in utils/vscode\_config

Point the nvim path to your `nvim` binary

Point your `init.vim` path to:

``` vim
$HOME/.config/nvim/vimscript/nv-vscode/init.vim
```

## Clipboard Support

- On Mac `pbcopy` should be built-in

- Ubuntu

    ```bash
    sudo apt install xsel
    ```

- Arch

    ```bash
    sudo pacman -S xsel
    ```

## LSP

To install a supported language server:

``` bash
  :LspInstall <your_language_server>
```

The only Language servers supported this way currently are `Python`,
`Javascript` and `Lua` the rest you will need to globally install and
configure under `lua/lsp/<your_lang.lua>`

For a more in depth LSP support:
[link](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)

## efm server is slow on close

Install the latest with:

``` bash
go get github.com/mattn/efm-langserver@HEAD
```

## Useful Programs

``` bash
ranger
ueberzug
fd
ripgrep
jq
fzf
lazygit
lazydocker
ncdu
pynvim
neovim-remote
```

## Formatters and Linters

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

## Vim Gists

To use vim-gists you will need to configure the following:

``` bash
git config --global github.user <username>
```

## Snippets

If you are looking for snippets checkout this github topic: [Snippet
Topic](https://github.com/topics/vscode-snippets)

## De-bugging

To set up your particular debugger, look here:
[link](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

## TODO

**HIGH PRIORITY**

From here I will update for bug fixes and implement low priority
features when I have time

**LOW PRIORITY**

- list all binaries needed for formatters and linters
- add badges to readme
- json config file (luajson)
- Implement what I can from this java config:
  [link](https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations)
  - better ui for code actions - formatting
  - setup junit tests for java
- look into emmet-ls
- toggle virtual text diagnostics
- configure neogit
- configure kshenoy/vim-signature
- vim ult test
- what is `fzy`
- https://github.com/pwntester/octo.nvim
- configure surround
- move to ultisnips

**PLUGIN BUGS**

- html snippets are broken with vsnip
- finding files from dashboard sometimes number not set (using startify
  for now)
- keep and eye on indent guides plugin for thin lines
- better auto-import (jsx)
