return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["o"] = "open",
        ["c"] = "close_node",
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
}
