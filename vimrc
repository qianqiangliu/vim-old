set incsearch
set mouse=v
set tags=./.tags;,.tags
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
function! MakeTags()
    let s:path = fnamemodify(expand('%:p'), ':h')
    let s:job = job_start(['ctags', '-R', '-f', s:path . '/.tags', s:path])
endfunction
command! MakeTags call MakeTags()

set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
command! -nargs=+ Grep execute 'silent grep! <args>' | copen 16

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

runtime! ftplugin/man.vim

cmap <C-B> <LEFT>
cmap <C-F> <RIGHT>
