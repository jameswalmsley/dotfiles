lvim.builtin.dashboard.active = true

lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    config = function()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

    -- Load the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufRead",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "p00f/nvim-ts-rainbow" },
  {"tpope/vim-sleuth"},
  {"axelf4/vim-strip-trailing-whitespace"},
  {"ggandor/lightspeed.nvim"},
}

