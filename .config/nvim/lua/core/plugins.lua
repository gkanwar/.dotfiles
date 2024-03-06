local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'rose-pine/neovim', as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- lsp support
      {'neovim/nvim-lspconfig'},
      -- autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  }
  use {
    'hedyhli/outline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>',
      { desc = 'Toggle outline' })
      require('outline').setup()
    end
  }
  use 'lervag/vimtex'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
