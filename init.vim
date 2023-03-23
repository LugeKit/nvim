set wildmenu
set mouse=a
set autoread
set noswapfile
set nu
set rnu
set ts=4
set sw=4
set ignorecase
set smartcase
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
nnoremap <leader>t gt
nnoremap <leader>T gT

nnoremap <leader><BS> :bd<CR>

" user defined command, must begin with upper case
command T tabnew

luafile ~/.config/nvim/start.lua
