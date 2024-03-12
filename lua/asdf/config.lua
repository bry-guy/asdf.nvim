local M = {
  -- auto_refresh = false,
  -- auto_install = false,
}

function M.setup(user_config)
  M = vim.tbl_deep_extend("force", M, user_config or {})
end

return M

