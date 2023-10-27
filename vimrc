set incsearch
set mouse=v
set tags=./.tags;,.tags
set wildmenu
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
filetype plugin indent on

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Linux kernel coding style
autocmd BufReadPost *
  \ if getline(1) =~ 'SPDX-License-Identifier:'
  \ |   exe "LinuxCodingStyle"
  \ | endif

" Line at center of window
autocmd BufReadPost * exe "normal! zz"

" netrw
let g:netrw_banner = 0
let g:netrw_altv = 1

" linuxsty
let g:linuxsty_patterns = [ "/linux", "/6.828/" ]

runtime! ftplugin/man.vim

" Toggle number
nnoremap <F3> :set number! relativenumber!<CR>
" Make ctags
nnoremap <F4> :!ctags -R -f .tags<CR>
" Remove trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Expand '%%' to current path
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

cmap <C-B> <LEFT>
cmap <C-F> <RIGHT>
