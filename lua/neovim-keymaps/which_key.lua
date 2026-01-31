local M = {}

-- Setup which-key integration
function M.setup(config)
  local has_which_key, wk = pcall(require, "which-key")

  if not has_which_key then
    vim.notify(
      "which-key not found. Install which-key to use this feature.",
      vim.log.levels.WARN
    )
    return
  end

  -- You can add which-key specific setup here
  -- This is a placeholder for future which-key integration
end

-- Register keymaps with which-key
function M.register(keymaps, opts)
  local has_which_key, wk = pcall(require, "which-key")

  if not has_which_key then
    return
  end

  wk.register(keymaps, opts)
end

return M
