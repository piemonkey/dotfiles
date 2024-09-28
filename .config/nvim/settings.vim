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
" Set default shiftwidth, to be overridden by vim-sleuth if it makes sense
set shiftwidth=2
" Use a browser-style stack for jump locations and restore viewport
set jumpoptions=stack,view
" What to save when exiting and opening (tweaked from default !,'100,<50,s10,h)
" set shada=!,'100,<50,s10,h,%

" These are commonly overridden in filetype definitions, so always switch them

" Turn off continuation of comments on newline
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
" Set linelength and auto wrap for comments
autocmd BufNewFile,BufRead * setlocal formatoptions+=c textwidth=100

" Filetype specific settings
autocmd FileType handlebars setlocal commentstring={{!\ %s\ }}
" autocmd FileType typescript.glimmer setlocal commentstring={{!\ %s\ }}
" autocmd FileType javascript.glimmer setlocal commentstring={{!\ %s\ }}
