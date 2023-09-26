set incsearch
set mouse=v
set tags+=./.tags;,.tags
set path+=**
set wildmenu
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
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

" netrw
let g:netrw_banner = 0
let g:netrw_altv = 1

runtime! ftplugin/man.vim

" number
nnoremap <F3> :set number! relativenumber!<CR>
" ctags
nnoremap <F4> :!ctags -R -f .tags<CR>
" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

cmap <C-B> <LEFT>
cmap <C-F> <RIGHT>

map th :tabnext<CR>
map tl :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>
