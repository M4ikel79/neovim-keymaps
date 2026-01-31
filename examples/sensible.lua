-- Sensible keymaps configuration using neovim-keymaps plugin
-- This provides a practical, well-organized set of keybindings

require("neovim-keymaps").setup({
  keymaps = {
    -- Normal mode
    n = {
      -- File operations
      ["<leader>w"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>q"] = { "<cmd>quit<cr>", "Quit" },
      ["<leader>Q"] = { "<cmd>quitall<cr>", "Quit all" },
      ["<leader>W"] = { "<cmd>write!<cr>", "Force save" },

      -- Better window navigation
      ["<C-h>"] = { "<C-w>h", "Go to left window" },
      ["<C-j>"] = { "<C-w>j", "Go to lower window" },
      ["<C-k>"] = { "<C-w>k", "Go to upper window" },
      ["<C-l>"] = { "<C-w>l", "Go to right window" },

      -- Window management
      ["<leader>sv"] = { "<C-w>v", "Split window vertically" },
      ["<leader>sh"] = { "<C-w>s", "Split window horizontally" },
      ["<leader>se"] = { "<C-w>=", "Make splits equal size" },
      ["<leader>sx"] = { "<cmd>close<cr>", "Close current split" },

      -- Buffer navigation
      ["<S-l>"] = { "<cmd>bnext<cr>", "Next buffer" },
      ["<S-h>"] = { "<cmd>bprevious<cr>", "Previous buffer" },
      ["<leader>bd"] = { "<cmd>bdelete<cr>", "Delete buffer" },
      ["<leader>bn"] = { "<cmd>enew<cr>", "New buffer" },

      -- Better line navigation (handle wrapped lines)
      ["j"] = { "v:count == 0 ? 'gj' : 'j'", "Move down", opts = { expr = true, silent = true } },
      ["k"] = { "v:count == 0 ? 'gk' : 'k'", "Move up", opts = { expr = true, silent = true } },

      -- Keep cursor centered when scrolling
      ["<C-d>"] = { "<C-d>zz", "Scroll down and center" },
      ["<C-u>"] = { "<C-u>zz", "Scroll up and center" },

      -- Search improvements
      ["n"] = { "nzzzv", "Next search result (centered)" },
      ["N"] = { "Nzzzv", "Previous search result (centered)" },

      -- Clear search highlights
      ["<leader>h"] = { "<cmd>nohlsearch<cr>", "Clear search highlights" },

      -- Quick save
      ["<C-s>"] = { "<cmd>write<cr>", "Save file" },

      -- Yank to system clipboard
      ["<leader>y"] = { '"+y', "Yank to system clipboard" },
      ["<leader>Y"] = { '"+Y', "Yank line to system clipboard" },

      -- Don't yank when pasting in visual mode
      ["<leader>p"] = { '"_dP', "Paste without yanking" },

      -- Quick macro recording (disable Q for ex mode)
      ["Q"] = { "@q", "Play macro q" },
      ["qq"] = { "qq", "Record macro q" },

      -- Make Y behave like D and C (yank to end of line)
      ["Y"] = { "y$", "Yank to end of line" },

      -- Undo breakpoints (more granular undo)
      [","] = { ",<c-g>u", "Undo breakpoint" },
      ["."] = { ".<c-g>u", "Undo breakpoint" },
      ["!"] = { "!<c-g>u", "Undo breakpoint" },
      ["?"] = { "?<c-g>u", "Undo breakpoint" },

      -- Quick line manipulation
      ["<A-j>"] = { ":m .+1<cr>==", "Move line down" },
      ["<A-k>"] = { ":m .-2<cr>==", "Move line up" },

      -- Better joining (keep cursor position)
      ["J"] = { "mzJ`z", "Join lines (keep cursor)" },

      -- Quick source init.lua
      ["<leader>r"] = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
    },

    -- Insert mode
    i = {
      -- Quick escape (the classics)
      ["jk"] = { "<Esc>", "Exit insert mode" },
      ["kj"] = { "<Esc>", "Exit insert mode" },
      ["jj"] = { "<Esc>", "Exit insert mode" },

      -- Quick save from insert mode
      ["<C-s>"] = { "<Esc><cmd>write<cr>a", "Save and continue editing" },

      -- Navigate within insert mode
      ["<C-h>"] = { "<Left>", "Move left" },
      ["<C-j>"] = { "<Down>", "Move down" },
      ["<C-k>"] = { "<Up>", "Move up" },
      ["<C-l>"] = { "<Right>", "Move right" },

      -- Quick line start/end
      ["<C-a>"] = { "<Home>", "Go to line start" },
      ["<C-e>"] = { "<End>", "Go to line end" },

      -- Delete word
      ["<C-w>"] = { "<C-o>db", "Delete word backward" },

      -- Quick line manipulation
      ["<A-j>"] = { "<Esc>:m .+1<cr>==gi", "Move line down" },
      ["<A-k>"] = { "<Esc>:m .-2<cr>==gi", "Move line up" },

      -- Undo breakpoints in insert mode
      [","] = { ",<c-g>u", "Undo breakpoint" },
      ["."] = { ".<c-g>u", "Undo breakpoint" },
      ["!"] = { "!<c-g>u", "Undo breakpoint" },
      ["?"] = { "?<c-g>u", "Undo breakpoint" },
    },

    -- Visual mode
    v = {
      -- Quick escape
      ["jk"] = { "<Esc>", "Exit visual mode" },
      ["kj"] = { "<Esc>", "Exit visual mode" },

      -- Better indenting (stay in visual mode)
      ["<"] = { "<gv", "Indent left" },
      [">"] = { ">gv", "Indent right" },

      -- Move text up and down
      ["J"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["K"] = { ":m '<-2<cr>gv=gv", "Move text up" },
      ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move text up" },

      -- Don't yank when pasting in visual mode
      ["p"] = { '"_dP', "Paste without yanking" },

      -- Yank to system clipboard
      ["<leader>y"] = { '"+y', "Yank to system clipboard" },

      -- Search for selection
      ["//"] = { 'y/\\V<C-R>=escape(@","/")<CR><CR>', "Search for selection" },
    },

    -- Visual block mode
    x = {
      -- Move text up and down
      ["J"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["K"] = { ":m '<-2<cr>gv=gv", "Move text up" },
      ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move text up" },

      -- Don't yank when pasting
      ["p"] = { '"_dP', "Paste without yanking" },
    },

    -- Terminal mode
    t = {
      -- Quick escape to normal mode
      ["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
      ["jk"] = { "<C-\\><C-n>", "Exit terminal mode" },
      ["kj"] = { "<C-\\><C-n>", "Exit terminal mode" },

      -- Window navigation from terminal
      ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Go to left window" },
      ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Go to lower window" },
      ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Go to upper window" },
      ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Go to right window" },
    },

    -- Command mode
    c = {
      -- Better navigation
      ["<C-a>"] = { "<Home>", "Go to start" },
      ["<C-e>"] = { "<End>", "Go to end" },
      ["<C-b>"] = { "<Left>", "Move left" },
      ["<C-f>"] = { "<Right>", "Move right" },
      ["<C-d>"] = { "<Delete>", "Delete character" },
    },
  },
})

-- Additional buffer-local keymaps for specific filetypes
local km = require("neovim-keymaps.keymap")

-- Lua files: quick source
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function(args)
    km.apply_buffer_keymaps(args.buf, {
      n = {
        ["<leader>x"] = { "<cmd>source %<cr>", "Source current file" },
        ["<leader>t"] = { "<cmd>PlenaryBustedFile %<cr>", "Run Plenary tests" },
      },
    })
  end,
})

-- Python files: quick run
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    km.apply_buffer_keymaps(args.buf, {
      n = {
        ["<leader>r"] = { "<cmd>!python %<cr>", "Run Python file" },
        ["<leader>t"] = { "<cmd>!python -m pytest %<cr>", "Run pytest" },
      },
    })
  end,
})

-- JavaScript/TypeScript files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function(args)
    km.apply_buffer_keymaps(args.buf, {
      n = {
        ["<leader>r"] = { "<cmd>!node %<cr>", "Run with Node" },
        ["<leader>t"] = { "<cmd>!npm test<cr>", "Run npm test" },
      },
    })
  end,
})

-- Quickhelp: Press <leader>? in normal mode to see all keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "NeovimKeymapsLoaded",
  callback = function()
    vim.keymap.set("n", "<leader>?", function()
      local km = require("neovim-keymaps")
      local all_keymaps = km.get_keymaps()
      
      print("=== Neovim Keymaps ===")
      for mode, mappings in pairs(all_keymaps) do
        print("\n[" .. mode .. " mode]")
        for key, mapping in pairs(mappings) do
          local desc = type(mapping) == "table" and mapping[2] or mapping
          print(string.format("  %s -> %s", key, desc))
        end
      end
    end, { desc = "Show all keymaps" })
  end,
})
