-- Neovim-Keymaps plugin entry point
-- This file is automatically sourced by Neovim

if vim.fn.has("nvim-0.7.0") == 0 then
  vim.api.nvim_err_writeln("neovim-keymaps requires Neovim >= 0.7.0")
  return
end

-- Prevent loading the plugin twice
if vim.g.loaded_neovim_keymaps then
  return
end
vim.g.loaded_neovim_keymaps = true

-- Create global access to the plugin
_G.neovim_keymaps = require("neovim-keymaps")
