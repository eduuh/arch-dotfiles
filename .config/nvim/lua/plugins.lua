local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
}
 use 'neovim/nvim-lspconfig'
 use 'hrsh7th/nvim-compe'
 use 'tpope/vim-commentary'
 use 'github/copilot.vim'
 use 'Pocco81/AutoSave.nvim'
 use 'nvim-telescope/telescope.nvim'
 use 'ThePrimeagen/git-worktree.nvim'
 use 'EdenEast/nightfox.nvim'
 use 'nvim-lua/plenary.nvim'
 use 'nvim-lua/popup.nvim'
 use 'ThePrimeagen/harpoon'
 use 'jlcrochet/vim-razor'
 use 'rstacruz/vim-closer'
 use 'tpope/vim-obsession'
 use 'puremourning/vimspector'
 use 'junegunn/limelight.vim'
 use 'godlygeek/tabular'
 use 'plasticboy/vim-markdown'
 use 'iamcco/markdown-preview.nvim'
     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
 use 'jose-elias-alvarez/null-ls.nvim'
 use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
 use 'mattn/emmet-vim'
 use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
}

end)
