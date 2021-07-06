require "default-config"
require "keymappings"
if io.open(CONFIG_PATH .. '/lv-config.lua', 'r') then
  vim.cmd("luafile " .. CONFIG_PATH .. "/lv-config.lua")
end
require('environment')
require "settings"
require "plugins"
require "lv-utils"
require "lv-galaxyline"
require "lv-treesitter"
require "lv-which-key"
require "lsp"
if O.lang.emmet.active then
  require "lsp.emmet-ls"
end
if O.lang.tailwindcss.active then
  require "lsp.tailwindcss-ls"
end

-- autoformat
if O.format_on_save then
  require("lv-utils").define_augroups {
    autoformat = {
      {
        "BufWritePre",
        "*",
        [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
      },
    },
  }
end
