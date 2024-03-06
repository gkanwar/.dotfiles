local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close
      }
    }
  }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fg', function()
  builtin.grep_string({ search = vim.fn.input('Grep >') })
end, { desc = '[f]ind by [g]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[f]ind [b]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind in [h]elp' })
vim.keymap.set('n', '<leader>fc', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[f]ind in [c]onfig' })
