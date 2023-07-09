vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('gkanwar', {}),
  pattern = '*',
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
  end,
})
