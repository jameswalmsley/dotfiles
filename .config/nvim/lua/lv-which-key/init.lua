-- if not package.loaded['which-key'] then
--  return
-- end
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup(O.plugin.which_key.setup)

local opts = O.plugin.which_key.opts
local vopts = O.plugin.which_key.vopts

local mappings = O.plugin.which_key.mappings
local vmappings = O.plugin.which_key.vmappings;

-- if O.plugin.ts_playground.active then
--   vim.api.nvim_set_keymap("n", "<leader>Th", ":TSHighlightCapturesUnderCursor<CR>", { noremap = true, silent = true })
--   mappings[""] = "Highlight Capture"
-- end

if O.plugin.zen.active then
  vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
  mappings["z"] = "Zen"
end

if O.plugin.telescope_project.active then
  -- open projects
  vim.api.nvim_set_keymap(
    "n",
    "<leader>P",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
  )
  mappings["P"] = "Projects"
end

if O.plugin.lush.active then
  mappings["L"] = {
    name = "+Lush",
    l = { ":Lushify<cr>", "Lushify" },
    x = { ":lua require('lush').export_to_buffer(require('lush_theme.cool_name'))", "Lush Export" },
    t = { ":LushRunTutorial<cr>", "Lush Tutorial" },
    q = { ":LushRunQuickstart<cr>", "Lush Quickstart" },
  }
end

local wk = require "which-key"

wk.register(mappings, opts)
wk.register(vmappings, vopts)
wk.register(O.distrib.which_key, opts)
wk.register(O.user_which_key, opts)
