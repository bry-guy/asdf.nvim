local utils = require("asdf.utils")

local M = {}

function M.tool(tool_name)
  if not tool_name or tool_name == "" then
    print("Please specify a tool name.")
    return
  end
  local cmd = "asdf install " .. tool_name
  local cmd_msg = "installing " .. tool_name
  utils.execute_command(cmd, cmd_msg)
end

return M

