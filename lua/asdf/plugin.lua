local utils = require("asdf.utils")

local M = {}

function M.plugin_add(plugin_name)
  if not plugin_name or plugin_name == "" then
    print("Please specify a plugin name.")
    return
  end

  local cmd = "asdf plugin add " .. plugin_name
  local cmd_msg = "adding " .. plugin_name
  utils.execute_command(cmd, cmd_msg)
end

return M

