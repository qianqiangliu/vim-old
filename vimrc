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

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'skywind3000/asyncrun.vim'
Plug 'thinca/vim-quickrun'
call plug#end()

" netrw
let g:netrw_banner = 0
let g:netrw_altv = 1

" airline
let g:airline_powerline_fonts = 1

" nerdtree
let NERDTreeMinimalUI = 1
autocmd BufEnter *
  \ if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
  \ |   quit
  \ | endif

" ack.vim
let g:ackprg = 'rg --vimgrep'

" vim-quickrun
let g:quickrun_config = {
  \   "_" : {
  \       "outputter" : "message",
  \   },
  \ }

runtime! ftplugin/man.vim

" Make ctags
nnoremap <F4> :AsyncRun ctags -R -f .tags<CR>
" Expand '%%' to current path
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
