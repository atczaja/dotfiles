
" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'Vundlevim/Vundle.vim'

" Colorscheme and Airline plugins
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'dikiaap/minimalist'
Plugin 'mhartington/oceanic-next'
Plugin 'ajh17/Spacegray.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'ajmwagar/vim-deus'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'

" Language plugins
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rust-lang/rust.vim'

call vundle#end()

" Generic
syntax enable
filetype plugin indent on
set number relativenumber
set encoding=utf-8
set wildmenu   " better tab completion
set showcmd    " show incomplete commands
set path+=**

" Tab settings
set tabstop=4
set shiftwidth=4
set noexpandtab

" Disable audio and visual bells
set noerrorbells visualbell t_vb=
autocmd GUIenter * set visualbell t_vb=

" Pathogen
"execute pathogen#infect()

"Colorscheme
set term=screen-256color
set t_Co=256
colorscheme jellybeans

" Clang Format
" To make .clang-format file for a project:
" $ clang-format -style=llvm -dump-config > .clang-format
map <C-K> :py3f /home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.py<CR> 

" vim-cpp-enhanced-highlighting options
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1


" Bracket Mappings 
" Remaps opening braces to auto insert closing brace
" Remaps closing braces to check if next char is that closing brace, and skips
" if true, else types closing brace as pressed
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" Tab Mappings
nnoremap <C-t> :tabedit 
nnoremap <C-h> gT
nnoremap <C-l> gt

" Set splitting directions to expected behavior
set splitright
set splitbelow

" Airline / Statusline
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline_theme = "jellybeans"
"set statusline=%f%m%r%h%w\ \ \ \ \ \ \ [%{&ff}]%y\ \ \ \ \ \ \ [%4lL,%4vC\ \|\ %LL\ \|\ %p%%]

" Lightline
" https://github.com/itchyny/lightline.vim
" http://newbilityvery.github.io/2017/08/04/switch-to-lightline/
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'active': {
	\   'left': [ ['mode', 'paste' ],
	\             [ 'readonly', 'filename', 'modified',] ]
	\ },
	\ 'component': {
	\   'charvaluehex': '0x%B'
	\ }
	\ }
"let g:lightline.tabline = {
"    \ 'left': [ ['buffers'] ],
"    \ 'right': [ ['close'] ]
"    \ }
"let g:lightline.component_expand = {
"    \ 'buffers': 'lightline#bufferline#buffers'
"	\ }
"let g:lightline.component_type = {
"    \ 'buffers': 'tabsel'
"	\ }
set noshowmode  " hide repeated info along bottom line
set laststatus=2 "  show statusline
"set showtabline=2 " show tabline
"set guioptions-=e  " hide gui tabline

