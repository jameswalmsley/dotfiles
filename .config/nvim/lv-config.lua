lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.side = "right"
lvim.format_on_save = false

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
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function()
      require'nvim-treesitter.configs'.setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          colors = {}, -- table of hex strings
          termcolors = {} -- table of colour name strings
        }
      }
    end,
  },
  {"tpope/vim-sleuth"},
  {"axelf4/vim-strip-trailing-whitespace"},
  {"ggandor/lightspeed.nvim"},
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require "lsp_signature".setup()
    end
  }
}

