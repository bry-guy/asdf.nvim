local function setup(_)
  vim.api.nvim_set_hl(0, 'AsdfOk', {fg = 'Green', bg = 'NONE', ctermfg = 'Green'})
  vim.api.nvim_set_hl(0, 'AsdfError', {fg = 'Red', bg = 'NONE', ctermfg = 'Red'})
end

return {
  setup = setup,
}

