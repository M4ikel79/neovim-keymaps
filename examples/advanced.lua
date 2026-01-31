-- Advanced example with multiple features

require("neovim-keymaps").setup({
  keymaps = {
    n = {
      -- Window management
      ["<leader>wv"] = { "<C-w>v", "Split window vertically" },
      ["<leader>wh"] = { "<C-w>s", "Split window horizontally" },
      ["<leader>wc"] = { "<C-w>c", "Close window" },
      ["<leader>wo"] = { "<C-w>o", "Close other windows" },

      -- Buffer management
      ["<S-h>"] = { "<cmd>bprevious<cr>", "Previous buffer" },
      ["<S-l>"] = { "<cmd>bnext<cr>", "Next buffer" },
      ["<leader>bd"] = { "<cmd>bdelete<cr>", "Delete buffer" },

      -- Quick save and quit
      ["<C-s>"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>qa"] = { "<cmd>quitall<cr>", "Quit all" },

      -- Better line movements
      ["j"] = { "v:count == 0 ? 'gj' : 'j'", "Move down", opts = { expr = true } },
      ["k"] = { "v:count == 0 ? 'gk' : 'k'", "Move up", opts = { expr = true } },

      -- Custom function keymap
      ["<leader>n"] = {
        function()
          vim.notify("Custom notification!", vim.log.levels.INFO)
        end,
        "Show notification"
      },
    },

    i = {
      -- Multiple escape options
      ["jk"] = { "<Esc>", "Exit insert mode" },
      ["kj"] = { "<Esc>", "Exit insert mode" },

      -- Save from insert mode
      ["<C-s>"] = { "<Esc><cmd>write<cr>a", "Save and continue" },
    },

    v = {
      -- Better indenting
      ["<"] = { "<gv", "Indent left" },
      [">"] = { ">gv", "Indent right" },

      -- Move text up and down
      ["J"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["K"] = { ":m '<-2<cr>gv=gv", "Move text up" },

      -- Paste without yanking
      ["p"] = { '"_dP', "Paste without yank" },
    },

    x = {
      ["<leader>p"] = { '"_dP', "Paste without yank" },
    },
  },
})

-- Example of buffer-local keymaps for specific filetypes
local km = require("neovim-keymaps.keymap")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "vim" },
  callback = function(args)
    km.apply_buffer_keymaps(args.buf, {
      n = {
        ["<leader>x"] = { "<cmd>source %<cr>", "Source current file" },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    km.apply_buffer_keymaps(args.buf, {
      n = {
        ["<leader>r"] = { "<cmd>!python %<cr>", "Run Python file" },
      },
    })
  end,
})
