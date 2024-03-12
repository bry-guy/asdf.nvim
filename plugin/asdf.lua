vim.api.nvim_create_user_command('AsdfReshim', function(opts)
  local tool = require("asdf.tool")
  tool.reshim(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfCurrent', function(opts)
  local tool = require("asdf.tool")
  tool.current(opts.args)
end, {nargs = "?"})

vim.api.nvim_create_user_command('AsdfToolVersions', function()
  local tool = require("asdf.tool")
  local path = tool.versions()
  if path ~= nil then
	vim.cmd('edit ' .. path)
  end
end, {nargs = 0})

vim.api.nvim_create_user_command('AsdfToolInstall', function(opts)
  local tool = require("asdf.tool")
  tool.install(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolUninstall', function(opts)
  local tool = require("asdf.tool")
  tool.uninstall(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolList', function(opts)
  local tool = require("asdf.tool")
  tool.list(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolListAll', function(opts)
  local tool = require("asdf.tool")
  tool.list_all(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginAdd', function(opts)
  local plugin = require("asdf.plugin")
  plugin.add(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginRemove', function(opts)
  local plugin = require("asdf.plugin")
  plugin.remove(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginList', function()
  local plugin = require("asdf.plugin")
  plugin.list()
end, {nargs = 1})

