-- Keys of power
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', '<S-CR>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-CR>', '<Esc>', { noremap = true })

-- Moving lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '$', '$l')