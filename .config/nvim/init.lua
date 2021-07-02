require('environment')
require('default-config')
if io.open(CONFIG_PATH .. '/lv-config.lua', 'r') then
	vim.cmd('luafile ' .. CONFIG_PATH .. '/lv-config.lua')
end
require('settings')
require('plugins')
require('colorscheme')
require('lv-utils')
require('keymappings')
require('lv-galaxyline')
require('lv-treesitter')
require('lv-which-key')
require('lsp')
if O.lang.emmet.active then require('lsp.emmet-ls') end
