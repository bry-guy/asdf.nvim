vim.api.nvim_create_user_command('AsdfInstall', function(opts)
  local install = require("asdf.install")
  install.tool(opts.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('AsdfPluginAdd', function(opts)
  local plugin = require("asdf.plugin")
  plugin.plugin_add(opts.args)
end, {nargs = 1})
