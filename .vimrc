" Generic
set nocompatible
syntax enable
filetype on
filetype plugin on
set number relativenumber
filetype indent plugin on
set encoding=utf-8

" Pathogen
execute pathogen#infect()

" Colorscheme
set t_Co=256
set background=dark
let g:enable_bold_font = 1
"colorscheme hybrid_reverse
"colorscheme badwolf
"let g:badwolf_tabline=0
colorscheme jellybeans
let g:jellybeans_use_term_italics = 1

" Tab settings
set tabstop=4
set softtabstop=4
set noexpandtab
set shiftwidth=4
set smarttab

" Clang Format
" To make .clang-format file for a project:
" $ clang-format -style=llvm -dump-config > .clang-format
map <C-K> :pyf /home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
imap <C-K> <c-o>:pyf /home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.py<cr>

" Bracket Mappings
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Tab Mappings
nnoremap <C-t> :tabedit 
nnoremap <C-h> gT
nnoremap <C-l> gt

" Window Mappings
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Nerdtree
"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline / Statusline
let g:airline_section_b = '%{strftime("%c")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "jellybeans"
set laststatus=2
