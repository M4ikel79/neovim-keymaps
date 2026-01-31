# Neovim-Keymaps Usage Guide

## Basic Configuration

### Simple Setup

```lua
require("neovim-keymaps").setup({
  keymaps = {
    n = {
      ["<leader>w"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>q"] = { "<cmd>quit<cr>", "Quit" },
    },
  },
})
```

### Multiple Modes

```lua
require("neovim-keymaps").setup({
  keymaps = {
    -- Normal mode
    n = {
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      ["<C-s>"] = { "<cmd>write<cr>", "Save" },
    },

    -- Insert mode
    i = {
      ["jk"] = { "<Esc>", "Exit insert mode" },
      ["<C-s>"] = { "<Esc><cmd>write<cr>", "Save from insert" },
    },

    -- Visual mode
    v = {
      ["<leader>y"] = { '"+y', "Copy to system clipboard" },
      ["<"] = { "<gv", "Indent left" },
      [">"] = { ">gv", "Indent right" },
    },

    -- Terminal mode
    t = {
      ["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
    },
  },
})
```

## Advanced Features

### Custom Options per Keymap

```lua
require("neovim-keymaps").setup({
  keymaps = {
    n = {
      ["<leader>w"] = {
        "<cmd>write<cr>",
        "Save file",
        opts = {
          silent = false,  -- Show command messages
          noremap = true,
        }
      },
    },
  },
})
```

### Buffer-Local Keymaps

```lua
-- In your filetype plugin or autocmd
local km = require("neovim-keymaps.keymap")

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
```

### Runtime Keymap Management

```lua
local km = require("neovim-keymaps")

-- Add a keymap at runtime
km.map("n", "<leader>t", "<cmd>echo 'Test'<cr>", { desc = "Test command" })

-- Remove a keymap
km.unmap("n", "<leader>t")
```

## Keymap Syntax

### Format Options

1. **Simple string format:**
   ```lua
   ["<leader>w"] = "<cmd>write<cr>"
   ```

2. **Table format with description:**
   ```lua
   ["<leader>w"] = { "<cmd>write<cr>", "Save file" }
   ```

3. **Table format with options:**
   ```lua
   ["<leader>w"] = {
     "<cmd>write<cr>",
     "Save file",
     opts = { silent = true, noremap = true }
   }
   ```

### Function Keymaps

```lua
require("neovim-keymaps").setup({
  keymaps = {
    n = {
      ["<leader>l"] = {
        function()
          vim.notify("Hello from keymap!", vim.log.levels.INFO)
        end,
        "Show notification"
      },
    },
  },
})
```

## Mode Reference

- `n` - Normal mode
- `i` - Insert mode
- `v` - Visual and Select mode
- `x` - Visual mode only
- `s` - Select mode
- `c` - Command-line mode
- `t` - Terminal mode

## Examples

### Complete Configuration Example

```lua
require("neovim-keymaps").setup({
  keymaps = {
    n = {
      -- File operations
      ["<leader>w"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>q"] = { "<cmd>quit<cr>", "Quit" },
      ["<leader>Q"] = { "<cmd>quitall<cr>", "Quit all" },

      -- Window navigation
      ["<C-h>"] = { "<C-w>h", "Go to left window" },
      ["<C-j>"] = { "<C-w>j", "Go to lower window" },
      ["<C-k>"] = { "<C-w>k", "Go to upper window" },
      ["<C-l>"] = { "<C-w>l", "Go to right window" },

      -- Buffer navigation
      ["<S-h>"] = { "<cmd>bprevious<cr>", "Previous buffer" },
      ["<S-l>"] = { "<cmd>bnext<cr>", "Next buffer" },
      ["<leader>bd"] = { "<cmd>bdelete<cr>", "Delete buffer" },
    },

    i = {
      -- Quick escape
      ["jk"] = { "<Esc>", "Exit insert mode" },
      ["kj"] = { "<Esc>", "Exit insert mode" },

      -- Save from insert mode
      ["<C-s>"] = { "<Esc><cmd>write<cr>", "Save file" },
    },

    v = {
      -- Better indenting
      ["<"] = { "<gv", "Indent left" },
      [">"] = { ">gv", "Indent right" },

      -- Move text up and down
      ["J"] = { ":m '>+1<cr>gv=gv", "Move text down" },
      ["K"] = { ":m '<-2<cr>gv=gv", "Move text up" },
    },
  },
})
```

## Tips

1. **Use leader key**: Prefix your custom keymaps with `<leader>` to avoid conflicts
2. **Be consistent**: Use a consistent naming scheme for related keymaps
3. **Add descriptions**: Always provide descriptions for better documentation
4. **Test carefully**: Test new keymaps to ensure they don't conflict with existing ones
