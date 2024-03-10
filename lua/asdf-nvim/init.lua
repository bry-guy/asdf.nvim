local health = require("asdf-nvim.health")
-- local install = require("asdf-nvim.install")
local config = require("asdf-nvim.config")

local M = {}

function M.setup(user_config)
  config.setup(user_config)
end

M.health_check = health.check
-- M.install_tool = install.tool

return M

