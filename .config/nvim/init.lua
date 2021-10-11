if os.getenv "LUNARVIM_INSTALL_DIR" then
  local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"
  local rtp = os.getenv "LUNARVIM_INSTALL_DIR"
  vim.opt.rtp:append(rtp)
end

require("lvim.bootstrap"):init()

require("lvim.config"):load()

local plugins = require "lvim.plugins"
local distro_plugins = require "distro.plugins"
require("lvim.plugin-loader"):load { plugins, distro_plugins, lvim.plugins }

local Log = require "lvim.core.log"
Log:debug "Starting LunarVim"

vim.g.colors_name = lvim.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.
vim.cmd("colorscheme " .. lvim.colorscheme)

local commands = require "lvim.core.commands"
commands.load(commands.defaults)

require("lvim.keymappings").setup()

require("lvim.lsp").setup()
