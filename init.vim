set wildmenu
set mouse=a
set noswapfile
set nu
set rnu
set ts=4
set sw=4
set ignorecase
set smartcase
set termguicolors
set nohlsearch
set clipboard=unnamedplus
set updatetime=200
let loaded_netrw = 1
let loaded_netrwPlugin = 1

let mapleader = ' '
" switch between tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader><Tab> gt
nnoremap <leader><S-Tab> gT
nnoremap <leader>t :tabnew<CR>

nnoremap <leader><BS> :bd<CR>

nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" paste in command line
cnoremap <C-v> <C-r>"
cnoremap <C-h> <C-Left>
cnoremap <C-l> <C-Right>

" call terminal
nnoremap <F1> <cmd>tabnew<CR><cmd>terminal<CR>A

autocmd FocusGained,BufEnter * checktime
autocmd BufReadPost *.log normal G

luafile ~/.config/nvim/start.lua
