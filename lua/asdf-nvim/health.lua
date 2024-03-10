local M = {}
local health = require('health')

local function check_tool_versions()
  local file_path = vim.fn.stdpath('config') .. '/.tool-versions'
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
        if res_line:match(version) then
          version_found = true
          break
        end
      end

      if version_found then
        health.report_ok(tool .. " " .. version .. " is installed.")
      else
        health.report_error("Missing " .. tool .. " version " .. version .. ".")
      end
    end
  end
end

function M.check()
  health.start('asdf')
  check_tool_versions()
  health.report_finish()
end

return M

