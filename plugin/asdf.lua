local utils = require("asdf.utils")
local plugin = require("asdf.plugin")
local tool = require("asdf.tool")

local function print_pretty(cmd, output, exit_code)
  utils.print_status(cmd, exit_code)

  if exit_code == 0 then
	utils.print_table(output)
  end
end

vim.api.nvim_create_user_command('AsdfReshim', function(opts)
  print_pretty(tool.reshim(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfCurrent', function(opts)
  print_pretty(tool.current(opts.args))
end, {nargs = "?"})

vim.api.nvim_create_user_command('AsdfToolVersions', function()
  local path = tool.versions()
  if path ~= nil then
	vim.cmd('edit ' .. path)
  end
end, {nargs = 0})

vim.api.nvim_create_user_command('AsdfToolInstall', function(opts)
  print_pretty(tool.install(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolUninstall', function(opts)
  print_pretty(tool.uninstall(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolList', function(opts)
  print_pretty(tool.list(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfToolListAll', function(opts)
  print_pretty(tool.list_all(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginAdd', function(opts)
  print_pretty(plugin.add(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginRemove', function(opts)
  print_pretty(plugin.remove(opts.args))
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginList', function()
  print_pretty(plugin.list())
end, {nargs = 1})

