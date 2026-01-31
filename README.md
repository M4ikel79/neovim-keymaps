# Neovim-Keymaps

A Neovim plugin for easy keymap management and configuration.

## Features

- Centralized keymap management
- Easy-to-read configuration syntax
- Support for different modes (normal, insert, visual, etc.)
- Keymap groups and categories
- Buffer-local and global keymaps
- Which-key integration support

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "yourusername/neovim-keymaps",
  config = function()
    require("neovim-keymaps").setup({
      -- your configuration here
    })
  end
}
```

### Using [packer.nvim](https://github.com/wpa_supplicant/packer.nvim)

```lua
use {
  'yourusername/neovim-keymaps',
  config = function()
    require('neovim-keymaps').setup()
  end
}
```

## Quick Start

```lua
require("neovim-keymaps").setup({
  keymaps = {
    -- Normal mode keymaps
    n = {
      ["<leader>w"] = { "<cmd>write<cr>", "Save file" },
      ["<leader>q"] = { "<cmd>quit<cr>", "Quit" },
    },
    -- Insert mode keymaps
    i = {
      ["jk"] = { "<Esc>", "Exit insert mode" },
    },
  },
})
```

## Documentation

See [docs](./docs) for detailed documentation.

## License

MIT
