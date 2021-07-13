--
-- This provides a file where "forks" can update the default settings
-- or plugins before the user-config is loaded.
--

O.distrib = {
  name = "LunarJim",
  plugins = {
    {
      "folke/tokyonight.nvim",
      config = function()
        -- Example config in Lua
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

        -- Load the colorscheme
        vim.cmd [[colorscheme tokyonight]]
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
    { "tpope/vim-sleuth" },
    { "axelf4/vim-strip-trailing-whitespace" },
    { "ggandor/lightspeed.nvim" },
  },

  which_key = {},
}

O.format_on_save = false

O.plugin.dashboard.active = true
O.plugin.galaxyline.active = true
O.plugin.zen.active = true
--O.plugin.indent_line.active = true
--O.plugin.ts_textobjects.active = true
--O.plugin.ts_textsubjects.active = true
--O.plugin.ts_hintobjects.active = true
O.plugin.telescope.defaults.path_display = {}
