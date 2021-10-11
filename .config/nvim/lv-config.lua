lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.side = "right"
lvim.format_on_save = true
lvim.lang.cpp.formatters = {
  {
    exe = 'clang_format',
    args = {},
    opts = {
      cwd = vim.fn.expand("%:p:h")
    }
  }
}

lvim.keys.normal_mode["<C-j>"] = ":cnext<CR>"
lvim.keys.normal_mode["<C-k>"] = ":cprev<CR>"

vim.opt.relativenumber=true

lvim.builtin.lualine.options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
}
lvim.builtin.lualine.sections.lualine_z = {
  "location"
}

