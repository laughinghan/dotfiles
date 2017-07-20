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
set cursorline " makes the cursor easier to find
set list listchars=tab:»\ ,trail:· " show tabs and trailing spaces but not normal spaces
set autoread " auto-reload unmodified buffers after git checkout

" for Airline
set laststatus=2
let g:airline_theme='powerlineish'

" Use "emacs-style" readline keybindings in command mode, see :help tcsh-style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>

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

" in visual mode, p pastes over current selection. Since that overwrites the
" current selection, the current selection is moved into the unnamed register.
" This is annoying because often I want to paste the same thing multiple
" times, but after the first paste, the thing I pasted over is what's pasted
" on the second paste. The following first deletes the current selection
" without moving it into any register, so that paste multiple times will work:
xnoremap <silent> p p:let @"=@0<CR>
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste

" When opening a file, if it's already open in a window somewhere, tell CtrlP
" to open a new instance instead of jumping to it.
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'results:40'

" Disable auto-folding of Markdown: https://github.com/plasticboy/vim-markdown#options
let g:vim_markdown_folding_disabled=1

" semantic-highlight.vim, with hand-tuned colors for my terminal
let g:semanticTermColors = [3,124,30,32,33,64,66,67,69,99,101,102,103,104,132,133,135,136,137,164,165,166,167,168,169,170,198,200]
au BufRead,BufNewFile *.js.erb set filetype=eruby.javascript
au FileType javascript,typescript,eruby.javascript SemanticHighlight

" syntax-highlight template strings in TypeScript files (vim-js-pretty-template)
autocmd FileType typescript JsPreTmpl html
