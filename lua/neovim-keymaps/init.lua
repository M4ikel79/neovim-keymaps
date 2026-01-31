local M = {}

-- Default configuration
local defaults = {
  keymaps = {},
  which_key = {
    enabled = false,
  },
  silent = true,
  noremap = true,
}

-- Plugin state
M.config = {}

-- Setup function
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})

  -- Apply keymaps
  if M.config.keymaps then
    require("neovim-keymaps.keymap").apply_keymaps(M.config.keymaps)
  end

  -- Initialize which-key integration if enabled
  if M.config.which_key.enabled then
    require("neovim-keymaps.which_key").setup(M.config.which_key)
  end
end

-- Add keymap at runtime
function M.map(mode, lhs, rhs, opts)
  require("neovim-keymaps.keymap").set(mode, lhs, rhs, opts)
end

-- Remove keymap
function M.unmap(mode, lhs)
  require("neovim-keymaps.keymap").del(mode, lhs)
end

-- Get all keymaps
function M.get_keymaps()
  return M.config.keymaps
end

return M
