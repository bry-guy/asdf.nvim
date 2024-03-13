local utils = require("asdf.utils")

local M = {}

function M.add(plugin_name)
  local cmd = "asdf plugin add " .. plugin_name
  return utils.exec(cmd)
end

function M.remove(plugin_name)
  local cmd = "asdf plugin remove " .. plugin_name
  return utils.exec(cmd)
end

function M.list()
  local cmd = "asdf plugin list --urls"
  return utils.exec(cmd)
end

return M

