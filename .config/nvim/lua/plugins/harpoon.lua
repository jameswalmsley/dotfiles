return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():append()
      end, { desc = "Add a file to harpoon" })
      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Show harpoon" })
      vim.keymap.set("n", "<leader>hj", function()
        harpoon:list():prev()
      end, { desc = "Goto the previous harpooned file" })
      vim.keymap.set("n", "<leader>hk", function()
        harpoon:list():next()
      end, { desc = "Goto the next harpooned file" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(1)
      end, { desc = "Goto harpoon file 1" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(2)
      end, { desc = "Goto harpoon file 2" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(3)
      end, { desc = "Goto harpoon file 3" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(4)
      end, { desc = "Goto harpoon file 4" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(5)
      end, { desc = "Goto harpoon file 5" })
    end,
  },
}
