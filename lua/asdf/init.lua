-- local install = require("asdf.install")
local config = require("asdf.config")


local M = {}

function M.setup(user_config)
  config.setup(user_config)
end

-- M.install_tool = install.tool

return M

