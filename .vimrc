call pathogen#infect()
set nocompatible
set backspace=indent,eol,start
filetype plugin indent on
set showcmd
syntax on
colorscheme desert
set expandtab autoindent shiftwidth=2 tabstop=2 softtabstop=2
set laststatus=2
set number
set cursorline
set list listchars=tab:»\ ,trail:·

" Always show at least one line above/below the cursor.
set scrolloff=1

" Syntax highlighting can slow down the world on lines that are too long.
" Don't.
set synmaxcol=2048

" <Ctrl-l> normally redraws the screen; this makes it also
" remove any search highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Enter is normally useless, and an "opposite" of J (join) is useful
nnoremap <silent> <CR> i<CR><Esc>

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
set incsearch " search as you type
set hlsearch " highlight all search results
set ignorecase " combo with smartcase
set smartcase " case-insensitive iff entirely lowercase,
              " but if you type something camelCased,
              " will be case-sensitive

" Use <Space> as <Leader> for Paredit
let g:paredit_leader = '<Space>'
