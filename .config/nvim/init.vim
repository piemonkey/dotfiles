" Source default config to e.g. get pacman installed plugins
source /etc/xdg/nvim/sysinit.vim
" Source my settings
source ~/.config/nvim/settings.vim

" Init plug and all plugins
call plug#begin('~/.config/nvim/site/autoload/plugged')

" Keybinding assist
Plug 'folke/which-key.nvim'
" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Fuzzy finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Auto indent style detection
Plug 'tpope/vim-sleuth'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" Completion
Plug 'ms-jpq/coq_nvim'
" Tab bar for buffers
Plug 'romgrk/barbar.nvim'
" File browser
Plug 'kyazdani42/nvim-tree.lua'
" Text object commenting
Plug 'tpope/vim-commentary'
" Markdown previewing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Editing 'surrounds' eg quotes together
Plug 'tpope/vim-surround'
" Git commands
Plug 'tpope/vim-fugitive'
" Switch between multi and single-line statements
Plug 'AndrewRadev/splitjoin.vim'
" icons
Plug 'nvim-tree/nvim-web-devicons'
" Add CVS info to sign column
Plug 'mhinz/vim-signify'

call plug#end()

" load plugin configs
lua require('plugins')
source ~/.config/nvim/configs/coq.vim

lua require('bindings.misc')
