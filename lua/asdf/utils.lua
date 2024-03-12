local config = require("asdf.config")

local M = {}

function M.debug(msg)
  if config.debug then
    print(msg)
  end
end

function M.ok(msg)
  vim.api.nvim_echo({{msg, "AsdfOk"}}, true, {})
end

function M.err(msg)
  vim.api.nvim_echo({{msg, "AsdfError"}}, true, {})
end

function M.execute(command, command_msg)
  if not command or command == "" then
    print("No command provided.")
    return
  end

  local output = vim.fn.systemlist(command)
  local exit_code = vim.v.shell_error

  if exit_code ~= 0 then
    M.err("ERROR: " .. command_msg)
    for _, line in ipairs(output) do
      print(line)
    end
  else
    M.ok("OK: " .. command_msg)
  end
end

function M.execute_output(command, command_msg)
  if not command or command == "" then
    print("No command provided.")
    return
  end

  local output = vim.fn.systemlist(command)
  local exit_code = vim.v.shell_error

  if exit_code ~= 0 then
    M.err("ERROR: " .. command_msg)
  else
    M.ok("OK: " .. command_msg)
  end

  for _, line in ipairs(output) do
	print(line)
  end
end

function M.print_table(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local fmt = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(fmt)
      M.print_table(v, indent+1)
    else
      print(fmt .. tostring(v))
    end
  end
end

return M

