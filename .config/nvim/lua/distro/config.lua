lvim.colorscheme = "catppuccin"
lvim.builtin.alpha.active = true
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.nvimtree.side = "right"
lvim.format_on_save = false

lvim.keys.normal_mode["<C-j>"] = ":cnext<CR>"
lvim.keys.normal_mode["<C-k>"] = ":cprev<CR>"

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
  filetypes = "sh"
}
