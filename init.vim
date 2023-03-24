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
set termguicolors
set nohlsearch
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

luafile ~/.config/nvim/start.lua
