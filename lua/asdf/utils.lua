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

function M.exec(cmd)
  if not cmd or cmd == "" then
    print("No command provided.")
    return
  end

  local output = vim.fn.systemlist(cmd)
  local exit_code = vim.v.shell_error

  return cmd, output, exit_code
end

function M.print_status(cmd, exit_code)
  if exit_code ~= 0 then
    M.err("ERROR: " .. cmd)
  else
    M.ok("OK: " .. cmd)
  end
end

function M.print_table(output)
  for _, line in ipairs(output) do
	print(line)
  end
end

return M

