local M = {}

-- Helper to merge options
local function merge_opts(default_opts, custom_opts)
  return vim.tbl_extend("force", default_opts, custom_opts or {})
end

-- Set a single keymap
function M.set(mode, lhs, rhs, opts)
  opts = opts or {}

  local default_opts = {
    silent = true,
    noremap = true,
  }

  -- If rhs is a table, extract command and description
  local cmd, desc
  if type(rhs) == "table" then
    cmd = rhs[1]
    desc = rhs[2]
    opts = merge_opts(default_opts, rhs.opts or {})
    opts.desc = desc
  else
    cmd = rhs
    opts = merge_opts(default_opts, opts)
  end

  vim.keymap.set(mode, lhs, cmd, opts)
end

-- Delete a keymap
function M.del(mode, lhs)
  vim.keymap.del(mode, lhs)
end

-- Apply multiple keymaps from configuration
function M.apply_keymaps(keymaps)
  for mode, mappings in pairs(keymaps) do
    if type(mappings) == "table" then
      for lhs, rhs in pairs(mappings) do
        M.set(mode, lhs, rhs)
      end
    end
  end
end

-- Apply buffer-local keymaps
function M.apply_buffer_keymaps(bufnr, keymaps)
  for mode, mappings in pairs(keymaps) do
    if type(mappings) == "table" then
      for lhs, rhs in pairs(mappings) do
        local opts = { buffer = bufnr }

        if type(rhs) == "table" then
          opts = vim.tbl_extend("force", opts, rhs.opts or {})
          opts.desc = rhs[2]
          vim.keymap.set(mode, lhs, rhs[1], opts)
        else
          vim.keymap.set(mode, lhs, rhs, opts)
        end
      end
    end
  end
end

return M
