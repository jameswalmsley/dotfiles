require('default-config')
if io.open(CONFIG_PATH .. '/lv-config.lua', 'r') then
	vim.cmd('luafile ' .. CONFIG_PATH .. '/lv-config.lua')
end
require('environment')
require('settings')
require('plugins')
require('lv-tokyonight')
vim.g.colors_name = O.colorscheme
vim.g.syntax = true
require('lv-utils')
require('keymappings')
require('lv-galaxyline')
require('lv-treesitter')
require('lv-which-key')
require('lsp')
if O.lang.emmet.active then require('lsp.emmet-ls') end
