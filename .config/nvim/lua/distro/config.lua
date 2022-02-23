lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.side = "right"
lvim.format_on_save = true


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

lvim.builtin.which_key.mappings["o"] = {
  name = "Octo",
  i = {
    c = {},
  }
}
