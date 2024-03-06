require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'html', 'javascript', 'json', 'lua', 'rust', 'markdown',
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
