local install = require("asdf.install")
local config = require("asdf.config")
local highlights = require("asdf.highlights")

local M = {}

function M.setup(opts)
  config.setup(opts)
  highlights.setup(opts)
end

M.install_tool = install.tool

return M

