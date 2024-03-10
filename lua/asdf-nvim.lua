local M = {}

function M.setup(config)
  local asdf_nvim = require("asdf-nvim")
  asdf_nvim.setup(config)
end

return M

