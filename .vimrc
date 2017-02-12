syntax on
filetype off
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set nocompatible

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number

set guifont=Menlo\ Regular\ for\ Powerline:h15

set laststatus=2

let mapleader = "\<Space>"

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" eskape from insert mode
imap jk <esc>
imap kj <esc>

" Save and go to next line
imap <C-s> <esc>:w<cr>

" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
"
" Edit your vimrc in a new tab
nmap <leader>vi :tabedit ~/.vimrc<cr>
"
" Copy the entire buffer into the system register
nmap <leader>co ggVG*y
"
" Edit the db/schema.rb Rails file in a split
nmap <leader>sc :split db/schema.rb<cr>
" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8
endif


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'Lokaltog/vim-powerline'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'heartsentwined/vim-emblem'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-rspec'
Plugin 'vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'vim-crystal'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'


call vundle#end()            " required
filetype plugin indent on

"let g:Powerline_symbols = 'fancy'

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =


" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

