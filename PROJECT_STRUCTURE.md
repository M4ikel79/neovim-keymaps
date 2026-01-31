# Neovim-Keymaps Project Structure

```
neovim-keymaps/
├── README.md                      # Main documentation
├── LICENSE                        # MIT License
├── .gitignore                    # Git ignore file
│
├── plugin/
│   └── neovim-keymaps.lua        # Plugin entry point (auto-loaded by Neovim)
│
├── lua/
│   └── neovim-keymaps/
│       ├── init.lua              # Main module with setup() function
│       ├── keymap.lua            # Keymap management logic
│       └── which_key.lua         # Which-key integration
│
├── examples/
│   ├── basic.lua                 # Basic configuration example
│   └── advanced.lua              # Advanced configuration example
│
└── docs/
    └── USAGE.md                  # Comprehensive usage guide
```

## File Descriptions

### Core Files

**plugin/neovim-keymaps.lua**
- Entry point automatically loaded by Neovim
- Checks Neovim version compatibility
- Prevents double-loading

**lua/neovim-keymaps/init.lua**
- Main module interface
- Exports setup(), map(), unmap(), get_keymaps()
- Manages plugin configuration

**lua/neovim-keymaps/keymap.lua**
- Core keymap management
- Functions: set(), del(), apply_keymaps(), apply_buffer_keymaps()
- Handles different keymap formats

**lua/neovim-keymaps/which_key.lua**
- Optional which-key integration
- Gracefully handles missing which-key plugin

### Documentation

**README.md**
- Project overview
- Installation instructions
- Quick start guide

**docs/USAGE.md**
- Comprehensive usage documentation
- Multiple configuration examples
- Mode reference and tips

### Examples

**examples/basic.lua**
- Simple configuration for beginners
- Basic file operations and navigation

**examples/advanced.lua**
- Complex configuration showcase
- Buffer-local keymaps
- Function-based keymaps
- FileType autocmds

## Usage

1. **Installation**: Copy to your Neovim plugins directory or use a plugin manager
2. **Configuration**: Add setup() call to your init.lua
3. **Customize**: Modify keymaps in your configuration file

## Key Features

- Clean, modular architecture
- Easy to extend
- Type-safe with descriptive errors
- Supports all Neovim modes
- Buffer-local and global keymaps
- Runtime keymap management
- Optional which-key integration
