"source ~/.vimrc
"
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=5                 " Keep at least 4 lines below cursor
set nocompatible

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set rnu

set fillchars=vert:\                " disable vert div chars

set cursorline                      " highlight the cursor screen line "
set cursorcolumn                      " highlight the cursor screen line "

set scrolloff=5                     " minimal number of screen lines to keep above and below the cursor "


set guifont=Menlo\ Regular\ for\ Powerline:h15

set laststatus=2

let mapleader = "\<Space>"

nmap <leader>vr :sp ~/.config/nvim/init.vim<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source ~/.config/nvim/init.vim<cr>

"more natural pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" eskape from insert mode
imap jk <esc>
imap kj <esc>

" Save and go to next line
imap <C-s> <esc>:w<cr>

" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
"
" Edit your vimrc in a new tab
nmap <leader>vi :tabedit ~/.config/nvim/init.vim<cr>
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


source ~/dotfiles/vim/nvim_plugins


filetype plugin indent on
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
colorscheme neodark


"fzf
set rtp+=/usr/local/opt/fzf
map <C-P> :FZF<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::'
\}
call deoplete#custom#source('buffer', 'rank', 501)


runtime macros/matchit.vim
