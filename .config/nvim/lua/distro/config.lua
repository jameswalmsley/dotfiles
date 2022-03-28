lvim.colorscheme = "catppuccin"
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.nvimtree.setup.quit_on_open = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.format_on_save = false
lvim.builtin.project.manual_mode = true

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
  filetypes = "sh",
}

local clangd_flags = {
  "--background-index",
  "--cross-file-rename",
  "--completion-style=bundled",
  "--header-insertion=never",
  "--suggest-missing-includes",
  "-j=8",
  "--pch-storage=memory",
}

require("lvim.lsp.manager").setup("clangd", {
  cmd = { "clangd", unpack(clangd_flags)},
})
