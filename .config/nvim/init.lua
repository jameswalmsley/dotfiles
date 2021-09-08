-- {{{ Bootstrap
local home_dir = vim.loop.os_homedir()

vim.cmd [[let &packpath = &runtimepath]]
-- }}}

_G.PLENARY_DEBUG = false -- Plenary destroys cache with this undocumented flag set to true by default
require("impatient").enable_profile()

local config = require "config"
config:init()
config:load()

local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins, lvim.plugins }

local Log = require "core.log"
Log:info "Starting LunarVim"

vim.g.colors_name = lvim.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.
vim.cmd("colorscheme " .. lvim.colorscheme)

local utils = require "utils"
utils.toggle_autoformat()
local commands = require "core.commands"
commands.load(commands.defaults)

require("lsp").config()

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup(lvim.lsp.null_ls.setup)
end

local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
if lsp_settings_status_ok then
  lsp_settings.setup {
    config_home = vim.fn.stdpath('config') .. "/lsp-settings",
  }
end

require("keymappings").setup()
