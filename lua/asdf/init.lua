local tool = require("asdf.tool")
local config = require("asdf.config")
local plugin = require("asdf.plugin")
local highlights = require("asdf.highlights")

local M = {}

function M.setup(opts)
  config.setup(opts)
  highlights.setup(opts)
end

M.reshim = tool.reshim
M.current = tool.current
M.tool_versions = tool.versions
M.tool_install = tool.install
M.tool_uninstall = tool.uninstall
M.tool_current = tool.current
M.tool_list = tool.list
M.tool_list_all = tool.list_all

M.plugin_add = plugin.add
M.plugin_remove = plugin.remove
M.plugin_list = plugin.list

return M

