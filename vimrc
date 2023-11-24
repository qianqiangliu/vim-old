set tags+=./.tags;,.tags
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set numberwidth=1
set relativenumber
set cursorline
set bg=dark

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
  \   exe "normal! g`\"" |
  \ endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregkh/kernel-coding-style'
Plug 'greymd/oscyank.vim'
Plug 'morhetz/gruvbox'
call plug#end()

" airline
let g:airline_powerline_fonts = 1

" ack.vim
let g:ackprg = 'rg --vimgrep'

" kernel-coding-style
let g:linuxsty_patterns = [ "/linux" ]
let g:linuxsty_save_path = 1

" oscyank.vim
noremap <leader>y :Oscyank<CR>

" gruvbox
colorscheme gruvbox

autocmd InsertEnter * exe ":set nornu"
autocmd InsertLeave * exe ":set rnu"

" Expand '%%' to current path
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
" List buffer
nnoremap <c-n> :CtrlPBuffer<CR>
" List MRU
nnoremap <c-m> :CtrlPMRUFiles<CR>

nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
