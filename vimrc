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

" ctags
nnoremap <F4> :!ctags -R -f .tags<CR>

set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

runtime! ftplugin/man.vim

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

cmap <C-B> <LEFT>
cmap <C-F> <RIGHT>
