local utils = require("asdf.utils")

local M = {}

function M.install(tool_name)
  local cmd = "asdf install " .. tool_name
  return utils.exec(cmd)
end

function M.uninstall(tool_name)
  local cmd = "asdf uninstall " .. tool_name
  return utils.exec(cmd)
end

function M.current(tool_name)
  local cmd

  if not tool_name or tool_name == "" then
	cmd = "asdf current"
  else
	cmd = "asdf current " .. tool_name
  end

  return utils.exec(cmd)
end

function M.reshim(tool_name)
  local cmd = "asdf reshim " .. tool_name
  return utils.exec(cmd)
end

function M.list(tool_name)
  local cmd = "asdf list " .. tool_name
  return utils.exec(cmd)
end

function M.list_all(tool_name)
  local cmd = "asdf list all " .. tool_name
  return utils.exec(cmd)
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

