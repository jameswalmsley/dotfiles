lvim.plugins['neuron'] = { active = false }
return {
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
  },
  {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"

    },

    config = function()
      local neogit = require("neogit")

      neogit.setup {
        disable_signs = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        auto_refresh = true,
        disable_builtin_notifications = false,
        commit_popup = {
          kind = "split",
        },
        -- customize displayed signs
        signs = {
          -- { CLOSED, OPENED }
          section = { ">", "v" },
          item = { ">", "v" },
          hunk = { "", "" },
        },
        integrations = {
          -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
          -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
          --
          -- Requires you to have `sindrets/diffview.nvim` installed.
          -- use {
          --   'TimUntersberger/neogit',
          --   requires = {
          --     'nvim-lua/plenary.nvim',
          --     'sindrets/diffview.nvim'
          --   }
          -- }
          --
          diffview = true
        },
        -- override/add mappings
        mappings = {
          -- modify status buffer mappings
          status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ["B"] = "BranchPopup",
            -- Removes the default mapping of "s"
            ["s"] = "",
          }
        }
      }

    end,

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
  },
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "jameswalmsley/phabrik",
    run = ":call phabrik#install()<CR>"
  },
  {
    "oberblastmeister/neuron.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    branch = 'unstable',
    disable = not lvim.plugins.neuron.active,
    config = function()
      require'neuron'.setup {
        virtual_titles = true,
        mappings = true,
        run = nil, -- function to run when in neuron dir
        neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
        leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
      }

    end,
  },
  {'plasticboy/vim-markdown'},
  {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  },
}

