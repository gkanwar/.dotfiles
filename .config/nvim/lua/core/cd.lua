local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cd_group = augroup('cdpwd', {})
autocmd('VimEnter', {
  group = cd_group,
  pattern = '*',
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
  end,
})
