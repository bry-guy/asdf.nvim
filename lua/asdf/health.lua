local tool = require("asdf.tool")

local M = {}

local start = vim.health.start or vim.health.report_start
local ok = vim.health.ok or vim.health.report_ok
local warn = vim.health.warn or vim.health.report_warn
local error = vim.health.error or vim.health.report_error

function M.check()
  start('asdf')
  local file_path = tool.versions()
  local lines = {}

  -- Read .tool-versions file line by line
  for line in io.lines(file_path) do
    if line ~= "" then  -- Skip empty lines
      table.insert(lines, line)
    end
  end

  -- Check each tool's versions
  for _, line in ipairs(lines) do
    local words = {}
    for word in line:gmatch("%S+") do table.insert(words, word) end
    local tool = words[1]
    table.remove(words, 1)

    for _, version in ipairs(words) do
      local result = vim.fn.systemlist("asdf list " .. tool)

      -- Check if result contains the expected version
      local version_found = false
      for _, res_line in ipairs(result) do
		local trimmed_line = res_line:match("^%s*(.-)%s*$")
		trimmed_line = trimmed_line:gsub("^%*", "")

		if trimmed_line == version then
		  version_found = true
		  break
		end
      end

      if version_found then
        ok(tool .. " " .. version .. " is installed.")
      else
        error("Missing " .. tool .. " version " .. version .. ".")
      end
    end
  end
end

return M

