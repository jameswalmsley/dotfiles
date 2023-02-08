-- lvim.plugins['neuron'] = { active = false }
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
            --vim.cmd [[colorscheme catppuccin]]
        end,
    },
    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd [[colorscheme catppuccin]]
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    --{
    --        "nvim-telescope/telescope-fzy-native.nvim",
    --        event = "BufRead",
    --},
    -- {
    --         "felipec/vim-sanegx",
    --         event = "BufRead",
    -- },
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
            "sindrets/diffview.nvim",
        },

        config = function()
            local neogit = require "neogit"

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
                    diffview = true,
                },
                -- override/add mappings
                mappings = {
                    -- modify status buffer mappings
                    status = {
                        -- Adds a mapping with "B" as key that does the "BranchPopup" command
                        ["B"] = "BranchPopup",
                        -- Removes the default mapping of "s"
                        ["s"] = "",
                    },
                },
            }
        end,
    },
    -- {
    --   "p00f/nvim-ts-rainbow",
    --   config = function()
    --     require("nvim-treesitter.configs").setup {
    --       rainbow = {
    --         enable = true,
    --         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --         max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --         -- colors = {}, -- table of hex strings
    --         -- termcolors = {} -- table of colour name strings
    --       },
    --     }
    --   end,
    -- },
    { "tpope/vim-sleuth" },
    -- { "axelf4/vim-strip-trailing-whitespace" },
    { "ggandor/lightspeed.nvim" },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        config = function()
            require("bqf").setup {
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
            }
        end,
    },
    {
        "jameswalmsley/phabrik",
        run = ":call phabrik#install()<CR>",
    },
    -- {
    --         "oberblastmeister/neuron.nvim",
    --         requires = {
    --                 'nvim-lua/plenary.nvim',
    --                 'nvim-telescope/telescope.nvim',
    --         },
    --         branch = 'unstable',
    --         disable = not lvim.plugins.neuron.active,
    --         config = function()
    --                 require'neuron'.setup {
    --                         virtual_titles = true,
    --                         mappings = true,
    --                         run = nil, -- function to run when in neuron dir
    --                         neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    --                         leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
    --                 }

    --         end,
    -- },
    { "plasticboy/vim-markdown" },
    {
        "glacambre/firenvim",
        run = function()
            vim.fn["firenvim#install"](0)
        end,
        config = function()
            vim.cmd [[
        let g:firenvim_config = { 
            \ 'globalSettings': {
                \ 'alt': 'all',
            \  },
            \ 'localSettings': {
                \ '.*': {
                    \ 'cmdline': 'neovim',
                    \ 'content': 'text',
                    \ 'priority': 0,
                    \ 'selector': 'textarea',
                    \ 'takeover': 'never',
                \ },
            \ }
        \ }

        if exists('g:started_by_firenvim')
          set guifont=guifont=Fira_Code:h22
        endif
      ]]
        end,
    },
    {
        "renerocksai/telekasten.nvim",
    },
    -- {
    --         'renerocksai/calendar-vim',
    -- },
    {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        event = "BufRead",
        config = function()
            require("octo").setup {
                default_remote = { "upstream", "origin" }, -- order to try remotes
                reaction_viewer_hint_icon = "", -- marker for user reactions
                user_icon = " ", -- user icon
                timeline_marker = "", -- timeline marker
                timeline_indent = "2", -- timeline indentation
                right_bubble_delimiter = "", -- Bubble delimiter
                left_bubble_delimiter = "", -- Bubble delimiter
                github_hostname = "", -- GitHub Enterprise host
                snippet_context_lines = 4, -- number or lines around commented lines
                file_panel = {
                    size = 10, -- changed files panel rows
                    use_icons = true, -- use web-devicons in file panel
                },
                mappings = {
                    issue = {
                        close_issue = "<space>oic", -- close issue
                        reopen_issue = "<space>oio", -- reopen issue
                        list_issues = "<space>oil", -- list open issues on same repo
                        reload = "<C-r>", -- reload issue
                        open_in_browser = "<C-b>", -- open issue in browser
                        copy_url = "<C-y>", -- copy url to system clipboard
                        add_assignee = "<space>oaa", -- add assignee
                        remove_assignee = "<space>oad", -- remove assignee
                        create_label = "<space>olc", -- create label
                        add_label = "<space>ola", -- add label
                        remove_label = "<space>old", -- remove label
                        goto_issue = "<space>ogi", -- navigate to a local repo issue
                        add_comment = "<space>oca", -- add comment
                        delete_comment = "<space>ocd", -- delete comment
                        next_comment = "]c", -- go to next comment
                        prev_comment = "[c", -- go to previous comment
                        react_hooray = "<space>orp", -- add/remove 🎉 reaction
                        react_heart = "<space>orh", -- add/remove ❤️ reaction
                        react_eyes = "<space>ore", -- add/remove 👀 reaction
                        react_thumbs_up = "<space>or+", -- add/remove 👍 reaction
                        react_thumbs_down = "<space>or-", -- add/remove 👎 reaction
                        react_rocket = "<space>orr", -- add/remove 🚀 reaction
                        react_laugh = "<space>orl", -- add/remove 😄 reaction
                        react_confused = "<space>orc", -- add/remove 😕 reaction
                    },
                    pull_request = {
                        checkout_pr = "<space>opo", -- checkout PR
                        merge_pr = "<space>opm", -- merge PR
                        list_commits = "<space>opc", -- list PR commits
                        list_changed_files = "<space>opf", -- list PR changed files
                        show_pr_diff = "<space>opd", -- show PR diff
                        add_reviewer = "<space>ova", -- add reviewer
                        remove_reviewer = "<space>ovd", -- remove reviewer request
                        close_issue = "<space>oic", -- close PR
                        reopen_issue = "<space>oio", -- reopen PR
                        list_issues = "<space>oil", -- list open issues on same repo
                        reload = "<C-r>", -- reload PR
                        open_in_browser = "<C-b>", -- open PR in browser
                        copy_url = "<C-y>", -- copy url to system clipboard
                        add_assignee = "<space>oaa", -- add assignee
                        remove_assignee = "<space>oad", -- remove assignee
                        create_label = "<space>olc", -- create label
                        add_label = "<space>ola", -- add label
                        remove_label = "<space>old", -- remove label
                        goto_issue = "<space>ogi", -- navigate to a local repo issue
                        add_comment = "<space>oca", -- add comment
                        delete_comment = "<space>ocd", -- delete comment
                        next_comment = "]c", -- go to next comment
                        prev_comment = "[c", -- go to previous comment
                        react_hooray = "<space>orp", -- add/remove 🎉 reaction
                        react_heart = "<space>orh", -- add/remove ❤️ reaction
                        react_eyes = "<space>ore", -- add/remove 👀 reaction
                        react_thumbs_up = "<space>or+", -- add/remove 👍 reaction
                        react_thumbs_down = "<space>or-", -- add/remove 👎 reaction
                        react_rocket = "<space>orr", -- add/remove 🚀 reaction
                        react_laugh = "<space>orl", -- add/remove 😄 reaction
                        react_confused = "<space>orc", -- add/remove 😕 reaction
                    },
                    review_thread = {
                        goto_issue = "<space>ogi", -- navigate to a local repo issue
                        add_comment = "<space>oca", -- add comment
                        add_suggestion = "<space>osa", -- add suggestion
                        delete_comment = "<space>ocd", -- delete comment
                        next_comment = "]c", -- go to next comment
                        prev_comment = "[c", -- go to previous comment
                        select_next_entry = "]q", -- move to previous changed file
                        select_prev_entry = "[q", -- move to next changed file
                        close_review_tab = "<C-c>", -- close review tab
                        react_hooray = "<space>orp", -- add/remove 🎉 reaction
                        react_heart = "<space>orh", -- add/remove ❤️ reaction
                        react_eyes = "<space>ore", -- add/remove 👀 reaction
                        react_thumbs_up = "<space>or+", -- add/remove 👍 reaction
                        react_thumbs_down = "<space>or-", -- add/remove 👎 reaction
                        react_rocket = "<space>orr", -- add/remove 🚀 reaction
                        react_laugh = "<space>orl", -- add/remove 😄 reaction
                        react_confused = "<space>orc", -- add/remove 😕 reaction
                    },
                    submit_win = {
                        approve_review = "<C-a>", -- approve review
                        comment_review = "<C-m>", -- comment review
                        request_changes = "<C-r>", -- request changes review
                        close_review_tab = "<C-c>", -- close review tab
                    },
                    review_diff = {
                        add_review_comment = "<space>oca", -- add a new review comment
                        add_review_suggestion = "<space>osa", -- add a new review suggestion
                        focus_files = "<leader>e", -- move focus to changed file panel
                        toggle_files = "<leader>b", -- hide/show changed files panel
                        next_thread = "]t", -- move to next thread
                        prev_thread = "[t", -- move to previous thread
                        select_next_entry = "]q", -- move to previous changed file
                        select_prev_entry = "[q", -- move to next changed file
                        close_review_tab = "<C-c>", -- close review tab
                        toggle_viewed = "<leader>o<space>", -- toggle viewer viewed state
                    },
                    file_panel = {
                        next_entry = "j", -- move to next changed file
                        prev_entry = "k", -- move to previous changed file
                        select_entry = "<cr>", -- show selected changed file diffs
                        refresh_files = "R", -- refresh changed files panel
                        focus_files = "<leader>e", -- move focus to changed file panel
                        toggle_files = "<leader>b", -- hide/show changed files panel
                        select_next_entry = "]q", -- move to previous changed file
                        select_prev_entry = "[q", -- move to next changed file
                        close_review_tab = "<C-c>", -- close review tab
                        toggle_viewed = "<leader><space>", -- toggle viewer viewed state
                    },
                },
            }
        end,
    },
}
