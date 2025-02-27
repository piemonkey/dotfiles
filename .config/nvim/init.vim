" Source default config to e.g. get pacman installed plugins
source /etc/xdg/nvim/sysinit.vim
" Source my settings
source ~/.config/nvim/settings.vim

" Init plug and all plugins
call plug#begin('~/.config/nvim/site/autoload/plugged')

" Display key mappings
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
" Mason for LSP and installing other external stuff
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Tab bar for buffers
Plug 'romgrk/barbar.nvim'
" File browser
Plug 'kyazdani42/nvim-tree.lua'
" Text object commenting
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
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
" Plug 'mhinz/vim-signify'
" Okay, just for git but seems better
Plug 'lewis6991/gitsigns.nvim'
" Repeat plugin actions with '.'
Plug 'tpope/vim-repeat'
" Autocomplete for html-ish tags (maybe superceded by autocomplete changes?)
" Plug 'windwp/nvim-ts-autotag'
Plug 'buschco/nvim-cmp-ts-tag-close'
" Open related files like templates
Plug 'rgroli/other.nvim'
" Format TS errors nicely
Plug 'MunifTanjim/nui.nvim'
Plug 'OlegGulevskyy/better-ts-errors.nvim'

call plug#end()

" load plugin configs
lua require('plugins')

lua require('bindings.misc')
