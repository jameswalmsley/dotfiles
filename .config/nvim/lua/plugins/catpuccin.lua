return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
