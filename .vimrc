
" Generic
set nocompatible
syntax enable
filetype on
filetype plugin on
filetype indent plugin on
set number relativenumber
set encoding=utf-8
set wildmenu   " better tab completion
set showcmd    " show incomplete commands

" Disable audio and visual bells
set noerrorbells visualbell t_vb=
autocmd GUIenter * set visualbell t_vb=

" Pathogen
execute pathogen#infect()

" Colorscheme
set t_Co=256
set background=dark
colorscheme hybrid_reverse
"colorscheme badwolf
"let g:badwolf_tabline=0
"colorscheme jellybeans
"let g:jellybeans_use_term_italics = 1
let g:enable_bold_font = 1

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

" Bracket Mappings 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i

" Tab Mappings
nnoremap <C-t> :tabedit 
nnoremap <C-h> gT
nnoremap <C-l> gt

" Set splitting directions to expected behavior
set splitright
set splitbelow

" Airline / Statusline
let g:airline_section_b = '%{strftime("%c")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
set laststatus=2

