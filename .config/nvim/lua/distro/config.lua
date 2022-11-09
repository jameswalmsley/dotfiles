lvim.colorscheme = "catppuccin"
lvim.builtin.alpha.active = true
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.enable = true
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.format_on_save = false
lvim.builtin.project.active = false
lvim.builtin.project.manual_mode = true

vim.opt.foldenable = false

lvim.keys.normal_mode["<C-j>"] = ":cnext<CR>"
lvim.keys.normal_mode["<C-k>"] = ":cprev<CR>"

lvim.builtin.terminal.open_mapping = "<c-t>"

vim.opt.relativenumber = true

lvim.builtin.lualine.options = {
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
}
lvim.builtin.lualine.sections.lualine_z = {
  "location",
}

lvim.builtin.which_key.mappings["o"] = {
  name = "Octo",
  i = {
    c = {},
  },
}

lvim.builtin.which_key.mappings["z"] = {
  name = "find notes",
  f = { function() require("telekasten").find_notes() end, "Find notes" },
  F = { function() require("telekasten").find_friends() end, "Find friends" },
  d = { function() require("telekasten").find_daily_notes() end, "Find daily notes" },
  g = { function() require("telekasten").search_notes() end, "Search  notes" },
  z = { function() require("telekasten").follow_link() end, "Follow link" },
  p = { function() require("telekasten").panel() end, "Panel" },
}

local function init_linters()
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "stylua",
  },
  {
    exe = "black",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  exe = "shellcheck",
  args = { "--severity", "warning" },
  filetypes = "sh",
}
end

pcall(init_linters)
