-- Basic example configuration for neovim-keymaps

require("neovim-keymaps").setup({
  keymaps = {
    -- Normal mode keymaps
    n = {
      -- File operations
      ["<leader>w"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>q"] = { "<cmd>quit<cr>", "Quit" },

      -- Better navigation
      ["<C-d>"] = { "<C-d>zz", "Scroll down and center" },
      ["<C-u>"] = { "<C-u>zz", "Scroll up and center" },
    },

    -- Insert mode keymaps
    i = {
      ["jk"] = { "<Esc>", "Exit insert mode" },
    },

    -- Visual mode keymaps
    v = {
      ["<"] = { "<gv", "Indent left" },
      [">"] = { ">gv", "Indent right" },
    },
  },
})
