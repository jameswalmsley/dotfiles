local M = {}

function M.config()
  lvim.builtin.autopairs = {
    active = true,
    on_config_done = nil,
    ---@usage  map <CR> on insert mode
    map_cr = true,
    ---@usage auto insert after select function or method item
    -- NOTE: This should be wrapped into a function so that it is re-evaluated when opening new files
    map_complete = vim.bo.filetype ~= "tex",
    ---@usage check treesitter
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false,
    },
  }
end

M.setup = function()
  local autopairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"
  local cond = require "nvim-autopairs.conds"

  autopairs.setup {
    check_ts = lvim.builtin.autopairs.check_ts,
    ts_config = lvim.builtin.autopairs.ts_config,
  }

  -- vim.g.completion_confirm_key = ""

  autopairs.add_rule(Rule("$$", "$$", "tex"))
  autopairs.add_rules {
    Rule("$", "$", { "tex", "latex" }) -- don't add a pair if the next character is %
      :with_pair(cond.not_after_regex_check "%%") -- don't add a pair if  the previous character is xxx
      :with_pair(cond.not_before_regex_check("xxx", 3)) -- don't move right when repeat character
      :with_move(cond.none()) -- don't delete if the next character is xx
      :with_del(cond.not_after_regex_check "xx") -- disable  add newline when press <cr>
      :with_cr(cond.none()),
  }
  autopairs.add_rules {
    Rule("$$", "$$", "tex"):with_pair(function(opts)
      print(vim.inspect(opts))
      if opts.line == "aa $$" then
        -- don't add pair on that line
        return false
      end
    end),
  }

  if package.loaded["cmp"] then
    require("nvim-autopairs.completion.cmp").setup {
      map_cr = true, --  map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
      auto_select = true, -- automatically select the first item
    }
  end

  require("nvim-treesitter.configs").setup { autopairs = { enable = true } }

  local ts_conds = require "nvim-autopairs.ts-conds"

  -- TODO: can these rules be safely added from "config.lua" ?
  -- press % => %% is only inside comment or string
  autopairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  }

  if lvim.builtin.autopairs.on_config_done then
    lvim.builtin.autopairs.on_config_done(autopairs)
  end
end

return M
