local M = {}

local Log = require "lvim.core.log"

local defaults = {
  active = true,
  on_config_done = nil,
  opts = {
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = "slide",

    ---@usage Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    ---@usage Function called when a window is closed
    on_close = nil,

    ---@usage timeout for notifications in ms, default 5000
    timeout = 5000,

    -- Render function for notifications. See notify-render()
    render = "default",

    ---@usage highlight behind the window for stages that change opacity
    background_colour = "Normal",

    ---@usage minimum width for notification windows
    minimum_width = 50,

    ---@usage Icons for the different levels
    icons = {
      ERROR = lvim.icons.diagnostics.Error,
      WARN = lvim.icons.diagnostics.Warning,
      INFO = lvim.icons.diagnostics.Information,
      DEBUG = lvim.icons.diagnostics.Debug,
      TRACE = lvim.icons.diagnostics.Trace,
    },
  },
}

function M.config()
  if not lvim.use_icons then
    defaults.opts.icons = {
      ERROR = "[ERROR]",
      WARN = "[WARNING]",
      INFO = "[INFO]",
      DEBUG = "[DEBUG]",
      TRACE = "[TRACE]",
    }
  end
  lvim.builtin.notify = vim.tbl_deep_extend("force", defaults, lvim.builtin.notify or {})
end

function M.setup()
  if #vim.api.nvim_list_uis() == 0 then
    -- no need to configure notifications in headless
    return
  end

  local opts = lvim.builtin.notify and lvim.builtin.notify.opts or defaults

  local status_ok, notify = pcall(require, "notify")
  if not status_ok then
    return
  end

  notify.setup(opts)
  vim.notify = notify
  Log:configure_notifications(notify)
end

return M
