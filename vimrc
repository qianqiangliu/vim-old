set incsearch
set mouse=v
set tags=./.tags;,.tags
set wildmenu
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set numberwidth=1
set relativenumber
syntax on
filetype plugin indent on

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
  \   exe "normal! g`\"" |
  \ endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'skywind3000/asyncrun.vim'
Plug 'gregkh/kernel-coding-style'
call plug#end()

" airline
let g:airline_powerline_fonts = 1

" ack.vim
let g:ackprg = 'rg --vimgrep'

" Linux kernel coding style
autocmd BufReadPost *
  \ if getline(1) =~ 'SPDX-License-Identifier:' |
  \   exe "LinuxCodingStyle" |
  \ endif

runtime! ftplugin/man.vim

" Make ctags
nnoremap <F4> :AsyncRun ctags -R -f .tags<CR>
" Expand '%%' to current path
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
