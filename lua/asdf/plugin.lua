local utils = require("asdf.utils")

local function act(action, verb, plugin_name)
  if not plugin_name or plugin_name == "" then
    print("Please specify a plugin name.")
    return
  end

  local cmd = "asdf plugin " .. action .. " " .. plugin_name
  local cmd_msg = verb .. " " .. plugin_name
  utils.execute(cmd, cmd_msg)
end

local M = {}

function M.add(plugin_name)
  local action = "add"
  local verb = "adding"
  act(action, verb, plugin_name)
end

function M.remove(plugin_name)
  local action = "remove"
  local verb = "removing"
  act(action, verb, plugin_name)
end

function M.list()
  local cmd = "asdf plugin list --urls"
  local cmd_msg = "listing plugins"
  utils.execute_output(cmd, cmd_msg)
end


return M

