local lvim_base_dir = debug.getinfo(1, 'S').source:match("(.*[/\\])"):sub(2, -2)

if lvim_base_dir ~= vim.fn.stdpath('config') then
  vim.opt.rtp:append(lvim_base_dir)
end

require("lvim.bootstrap"):init(lvim_base_dir)

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

