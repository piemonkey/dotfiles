" Line numbers
set number
" Switch buffers without having to save
set hidden
" Highlight cursor line
set cursorline
" 24-bit colors
set termguicolors
" Set colourscheme
colorscheme torte
" Always leave space for marks, to avoid whole file moving when one appears
set signcolumn=yes

" These are commonly overridden in filetype definitions, so always switch them

" Turn off continuation of comments on newline
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
" Set linelength and auto wrap for comments
autocmd BufNewFile,BufRead * setlocal formatoptions+=c textwidth=100
