local M = {
  banner = {
    "",
    [[    __                          _    ___         ]],
    [[   / /   __  ______  ____ _____| |  / (_)___ ___ ]],
    [[  / /   / / / / __ \/ __ `/ ___/ | / / / __ `__ \]],
    [[ / /___/ /_/ / / / / /_/ / /   | |/ / / / / / / /]],
    [[/_____/\__,_/_/ /_/\__,_/_/    |___/_/_/ /_/ /_/ ]],
  },
}

local fmt = string.format

local function str_list(list)
  return fmt("[ %s ]", table.concat(list, ", "))
end

local function get_formatter_suggestion_msg(ft)
  local config = require "config"
  local null_formatters = require "lsp.null-ls.formatters"
  local supported_formatters = null_formatters.list_available(ft)
  local section = {
    " HINT ",
    "",
    fmt("* List of supported formatters: %s", str_list(supported_formatters)),
  }

  if not vim.tbl_isempty(supported_formatters) then
    vim.list_extend(section, {
      "* Configured formatter needs to be installed and executable.",
      fmt("* Enable installed formatter(s) with following config in %s", config.path),
      "",
      fmt("  lvim.lang.%s.formatters = { { exe = '%s' } }", ft, table.concat(supported_formatters, "│")),
    })
  end

  return section
end

local function get_linter_suggestion_msg(ft)
  local config = require "config"
  local null_linters = require "lsp.null-ls.linters"
  local supported_linters = null_linters.list_available(ft)
  local section = {
    " HINT ",
    "",
    fmt("* List of supported linters: %s", str_list(supported_linters)),
  }

  if not vim.tbl_isempty(supported_linters) then
    vim.list_extend(section, {
      "* Configured linter needs to be installed and executable.",
      fmt("* Enable installed linter(s) with following config in %s", config.path),
      "",
      fmt("  lvim.lang.%s.linters = { { exe = '%s' } }", ft, table.concat(supported_linters, "│")),
    })
  end

  return section
end

local function tbl_set_highlight(terms, highlight_group)
  for _, v in pairs(terms) do
    vim.cmd('let m=matchadd("' .. highlight_group .. '", "' .. v .. "[ ,│']\")")
  end
end

function M.toggle_popup(ft)
  local lsp_utils = require "lsp.utils"
  local client = lsp_utils.get_active_client_by_ft(ft)
  local is_client_active = false
  local client_enabled_caps = {}
  local client_name = ""
  local client_id = 0
  local document_formatting = false
  if client ~= nil then
    is_client_active = not client.is_stopped()
    client_enabled_caps = require("lsp").get_ls_capabilities(client.id)
    client_name = client.name
    client_id = client.id
    document_formatting = client.resolved_capabilities.document_formatting
  end

  local header = {
    fmt("Detected filetype:      %s", ft),
    fmt("Treesitter active:      %s", tostring(next(vim.treesitter.highlighter.active) ~= nil)),
  }

  local text = require "interface.text"
  local lsp_info = {
    "Language Server Protocol (LSP) info",
    fmt("* Associated server:    %s", client_name),
    fmt("* Active:               %s (id: %d)", tostring(is_client_active), client_id),
    fmt("* Supports formatting:  %s", tostring(document_formatting)),
  }
  if not vim.tbl_isempty(client_enabled_caps) then
    local caps_text = "* Capabilities list:    "
    local caps_text_len = caps_text:len()
    local enabled_caps = text.format_table(client_enabled_caps, 3, " | ")
    enabled_caps = text.shift_right(enabled_caps, caps_text_len)
    enabled_caps[1] = fmt("%s%s", caps_text, enabled_caps[1]:sub(caps_text_len + 1))
    vim.list_extend(lsp_info, enabled_caps)
  end
  local null_ls = require "lsp.null-ls"
  local registered_providers = null_ls.list_supported_provider_names(ft)
  local registered_count = vim.tbl_count(registered_providers)
  local null_ls_info = {
    "Formatters and linters",
    fmt(
      "* Configured providers: %s%s",
      table.concat(registered_providers, "  , "),
      registered_count > 0 and "  " or ""
    ),
  }

  local null_formatters = require "lsp.null-ls.formatters"
  local missing_formatters = null_formatters.list_unsupported_names(ft)
  local missing_formatters_status = {}
  if not vim.tbl_isempty(missing_formatters) then
    missing_formatters_status = {
      fmt("* Missing formatters:   %s", table.concat(missing_formatters, "  , ") .. "  "),
    }
  end

  local null_linters = require "lsp.null-ls.linters"
  local missing_linters = null_linters.list_unsupported_names(ft)
  local missing_linters_status = {}
  if not vim.tbl_isempty(missing_linters) then
    missing_linters_status = {
      fmt("* Missing linters:      %s", table.concat(missing_linters, "  , ") .. "  "),
    }
  end

  local content_provider = function(popup)
    local content = {}

    for _, section in ipairs {
      M.banner,
      { "" },
      { "" },
      header,
      { "" },
      lsp_info,
      { "" },
      null_ls_info,
      missing_formatters_status,
      missing_linters_status,
      { "" },
      { "" },
      get_formatter_suggestion_msg(ft),
      { "" },
      { "" },
      get_linter_suggestion_msg(ft),
    } do
      vim.list_extend(content, section)
    end

    return text.align_left(popup, content, 0.5)
  end

  local function set_syntax_hl()
    vim.cmd [[highlight LvimInfoIdentifier gui=bold]]
    vim.cmd [[highlight link LvimInfoHeader Type]]
    vim.cmd [[let m=matchadd("LvimInfoHeader", "Language Server Protocol (LSP) info")]]
    vim.cmd [[let m=matchadd("LvimInfoHeader", "Formatters and linters")]]
    vim.cmd('let m=matchadd("LvimInfoIdentifier", " ' .. ft .. '$")')
    vim.cmd 'let m=matchadd("string", "true")'
    vim.cmd 'let m=matchadd("error", "false")'
    tbl_set_highlight(registered_providers, "LvimInfoIdentifier")
    tbl_set_highlight(missing_formatters, "LvimInfoIdentifier")
    tbl_set_highlight(missing_linters, "LvimInfoIdentifier")
    -- tbl_set_highlight(require("lsp.null-ls.formatters").list_available(ft), "LvimInfoIdentifier")
    -- tbl_set_highlight(require("lsp.null-ls.linters").list_available(ft), "LvimInfoIdentifier")
    vim.cmd('let m=matchadd("LvimInfoIdentifier", "' .. client_name .. '")')
  end

  local Popup = require("interface.popup"):new {
    win_opts = { number = false },
    buf_opts = { modifiable = false, filetype = "lspinfo" },
  }
  Popup:display(content_provider)
  set_syntax_hl()

  return Popup
end
return M
