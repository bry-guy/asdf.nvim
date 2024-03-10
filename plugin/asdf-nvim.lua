local M = {}

print("asdf-nvim: outside of fn")

function M.setup(config)
  print("asdf-nvim: setup")
  local asdf_nvim = require("asdf-nvim")
  asdf_nvim.setup(config)
end

return M

