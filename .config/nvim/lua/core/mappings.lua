-- Keys of power
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', '<S-CR>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-CR>', '<Esc>', { noremap = true })

-- Moving lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Inserting lines
-- vim.keymap.set('n', 'o', 'o<Esc>0"_D')
-- vim.keymap.set('n', 'O', 'O<Esc>0"_D')
vim.keymap.set('n', 'zj', 'o<Esc>k')
vim.keymap.set('n', 'zk', 'O<Esc>j')

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '$', '$l')

-- Windows
vim.keymap.set('n', ',h', ':split<CR>')
vim.keymap.set('n', ',v', ':split<CR>')
vim.keymap.set('n', ',x', ':close<CR>')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Search
vim.keymap.set('n', '<Esc>', ':noh<Bar>:echo<CR><Esc>')
