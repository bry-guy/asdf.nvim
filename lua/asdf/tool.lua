local utils = require("asdf.utils")

local M = {}

function M.install(tool_name)
  if not tool_name or tool_name == "" then
    print("Please specify a tool name.")
    return
  end

  local cmd = "asdf install " .. tool_name
  local cmd_msg = "installing " .. tool_name
  utils.execute(cmd, cmd_msg)
end

function M.uninstall(tool_name)
  if not tool_name or tool_name == "" then
    print("Please specify a tool name.")
    return
  end

  local cmd = "asdf uninstall " .. tool_name
  local cmd_msg = "uninstalling " .. tool_name
  utils.execute(cmd, cmd_msg)
end

function M.current(tool_name)
  local cmd, cmd_msg
  if not tool_name or tool_name == "" then
	cmd = "asdf current"
	cmd_msg = "current tools"
  else
	cmd = "asdf current " .. tool_name
	cmd_msg = "current tool " .. tool_name
  end

  utils.execute_output(cmd, cmd_msg)
end

function M.reshim(tool_name)
  local cmd = "asdf reshim " .. tool_name
  local cmd_msg = "reshimming " .. tool_name
  utils.execute(cmd, cmd_msg)
end

function M.list(tool_name)
  local cmd = "asdf list " .. tool_name
  local cmd_msg = "listing " .. tool_name
  utils.execute_output(cmd, cmd_msg)
end

function M.list_all(tool_name)
  local cmd = "asdf list all " .. tool_name
  local cmd_msg = "listing all " .. tool_name
  utils.execute_output(cmd, cmd_msg)
end

function M.versions()
  local paths_to_check = {
    '.',
    vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    os.getenv("XDG_CONFIG_HOME")
  }

  for _, path in ipairs(paths_to_check) do
    local tool_versions_path = path .. '/.tool-versions'
    if vim.fn.filereadable(vim.fn.expand(tool_versions_path)) == 1 then
      return tool_versions_path
	end
  end

  utils.err("ERROR: no .tool-versions file found.")
  return nil
end

return M

