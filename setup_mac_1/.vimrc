" ------------------------------------------------------
" basic settings
" ------------------------------------------------------

" set compatibility to vim only
set nocompatible

" show line numbers 
set number
set numberwidth=2

" set number of whitespaces for each tab
set tabstop=2

" set number of whitespaces for each indent
set shiftwidth=2

" Wrap
" set wrap " wrap long lines
set nowrap " do not wrap long lines

" encoding
set encoding=utf-8

" change end of buffer symbol from '~' to '.'
set fillchars=eob:.

" current line
" set cursorline " highlight cursor line
set nocursorline " unhighlight cursor line

" turn syntax highlighting on
syntax on

" change line using arrow keys at beginning or end of line
set whichwrap+=<,>,[,],h,l

" enable mouse
set mouse=n

" set the directory in which the swap files are stored
set directory^=~/.vim/tmp//

" set the location of the viminfo file
set viminfo+=n~/.vim/viminfo

" show / hide tab line
set showtabline=1 " hide tab bar
" set showtabline=2 " show tab bar

" tab line
set tabline=%!mytabline#Line()

" status bar
set laststatus=0 " hide status bar
" set laststatus=1 " show status bar

" color scheme
" see in the following link for images of color schemes:
" https://vimcolorschemes.com/vim/colorschemes
colorscheme evening

" turn of background highlighting of colorscheme
highlight Normal ctermbg=none

" highlighting of matching parenthesis
" highlight MatchParen cterm=bold ctermbg=none ctermfg=none

" highlighting LineNr the same as Comments
highlight! link LineNr Comment

" highlighting Todo the same as Comments
highlight! link Todo Comment

" highlighting EndOfBuffer the same as Comments
highlight! link EndOfBuffer Comment

" highlighting EndOfBuffer the same as Comments
highlight! link VertSplit Comment

" ------------------------------------------------------
" plugins
" ------------------------------------------------------

call plug#begin()

" un / comment lines
Plug 'tpope/vim-commentary'

" git plugins
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" fuzzy finder
" Plug 'junegunn/fzf.vim'

call plug#end()

" ------------------------------------------------------
" mappings
" ------------------------------------------------------

" save file
" nmap <a-s> <esc>:update<cr>
" imap <a-s> <esc>:update<cr>

" scrolling
map <a-Up> <c-y>
map <a-Down> <c-e>
map <a-Left> z<Left>
map <a-Right> z<Right>

" select a word
nmap <space> viw

" search files with fzf
noremap <c-p> :Files<cr>

" search in files with RG
nmap <c-f> :Rg<cr>

" search for highlighted text in Files with Rg
vmap <c-f> "0y:Rg <c-r>0<cr>

" yank / paste text to clipboard
vmap <a-c> "+y
map <a-v> "+p

" arglist
map <c-End> :execute 'set showtabline=' . (&showtabline ==# 0 ? 1 : 0)<CR>
map <c-Home> <esc>:tabnew<cr>
map <c-Delete> <esc>:tabclose<cr>
map <c-Left> <esc>:tabprevious<cr>
map <c-Right> <esc>:tabnext<cr>

" no highlighting
nmap <a-n> :noh<cr>

" git blame
map <a-b> <esc>:Git blame<cr>

" use alt key for window management
nmap <a-w> <c-w>

