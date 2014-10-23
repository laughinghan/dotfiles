execute pathogen#infect()

" Vi-mode sucks
set nocompatible
set backspace=indent,eol,start

" auto-syntax highlight
filetype plugin indent on
syntax on
colorscheme desert

set showcmd " show multi-char commands as you type
set expandtab autoindent shiftwidth=2 tabstop=2 softtabstop=2 " indent settings
set laststatus=2 " for Powerline
set cursorline " makes the cursor easier to find
set list listchars=tab:»\ ,trail:· " show tabs and trailing spaces but not normal spaces

" relativenumber makes most numbers in the gutter relative; number then
" makes the current cursor line, rather than always 0 (which is
" uninformative), the line number.
" https://groups.google.com/d/msg/vim_dev/VBKxaoILi0s/l9o-OHv3vtkJ
set number
set relativenumber

" Always show at least one line above/below the cursor.
set scrolloff=1

" Syntax highlighting can slow down the world on lines that are too long.
" Don't.
set synmaxcol=2048

" Enter is normally useless, and an "opposite" of J (join) is useful
nnoremap <silent> <CR> i<CR><Esc>

" I use <C-i> way less often than I switch windows
nnoremap <Tab> <C-w>
nnoremap <C-w> <C-i>

" make :vs path/to/file.ext and :sp path/to/file.ext do
" the expected thing, i.e., open the file in the newly
" split buffer rather than the original
set splitright
set splitbelow

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" search
set gdefault " default substitute all matches on each line, g flag toggles
             " that off (to only substitute first mach on each line)
set incsearch " search as you type
set hlsearch " highlight all search results
set ignorecase " combo with smartcase
set smartcase " case-insensitive iff entirely lowercase,
              " but if you type something camelCased,
              " will be case-sensitive

" <Ctrl-l> normally redraws the screen; this makes it also
" remove any search highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" n always searches forwards in the file and N always searches backwards,
" regardless of whether the last search command was /, ?, *, or #
" http://stackoverflow.com/a/25740547/362030
noremap <expr> n 'Nn'[v:searchforward]
noremap <expr> N 'nN'[v:searchforward]

" Configure vim-easymotion 2.0: https://github.com/Lokaltog/vim-easymotion#default-bindings
" Use Spacebar as EasyMotion hotkey:
map <Space> <Plug>(easymotion-prefix)
" Jump to anywhere! But most importantly, after _'s:
map <Space>a <Plug>(easymotion-jumptoanywhere)
" On <Space>j or <Space>k, stay in the same column, instead of start of line:
let g:EasyMotion_startofline = 0
" Use only homerow keys rather than all letters as motion targets:
let g:EasyMotion_keys = 'asdfgASDFGHJKL:hjkl;'

" When opening a file, if it's already open in a window somewhere, tell CtrlP
" to open a new instance instead of jumping to it.
let g:ctrlp_switch_buffer = 0

" Disable auto-folding of Markdown: https://github.com/plasticboy/vim-markdown#options
let g:vim_markdown_folding_disabled=1
