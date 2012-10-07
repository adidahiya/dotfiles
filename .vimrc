filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'myusuf3/numbers.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'sjl/vitality.vim'

" Powerline
let g:Powerline_stl_path_style = 'short'
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

" Vitality
let g:vitality_always_assume_iterm = 1

set nocompatible
set laststatus=2          " Always show status line
set lazyredraw
set linebreak
set wildmenu              " Enhanced command-line completion
set ttyfast               " Optimize for fast terminal connections
set number                " Show line numbers
set hlsearch              " Highlight searches
set ignorecase            " Ignore case of searches
set smartcase             " Smarter casing
set incsearch             " Highlight dynamically as pattern is typed
set mouse=a               " Enable mouse in all modes
set nostartofline         " Don't reset cursor to start of line when moving around
set ruler                 " Show the cursor position
set title                 " Show the filename in the window titlebar
set showcmd               " Show the (partial) command as it's being typed
set scrolloff=4           " Start scrolling 4 lines before the horizontal window border
set encoding=utf-8        " Filetype encoding
set modelines=0
set autoindent            " Auto indenting on next line
set hidden
set visualbell            " Visual indicator instead of system beep
set cursorline            " Show vertical line underneath cursor
set backspace=indent,eol,start
set norelativenumber
set history=1000
set undofile
set undoreload=10000
set nocp
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set dictionary=/usr/share/dict/words
set ofu=syntaxcomplete#Complete

" Tabs, spaces, wrapping
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set wrap
set textwidth=80
set formatoptions=qrn1

" Code folding
set foldcolumn=0
set foldlevel=0
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " don't fold by default

" Color scheme
syntax on
set grepprg=grep\ -nH\ $*
set colorcolumn=80
set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized
" colorscheme tomorrow-night-bright
" colorscheme molokai
colorscheme badwolf

" Color of ruler @ 80 col
highlight ColorColumn ctermbg=0

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Custom key bindings
" Navigate between split buffers
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

"Strip trailing whitespaces (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"Automatic commands
if has("autocmd")
    " Enable filetype detection
    " filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .less, .scss files as .css
    autocmd BufNewFile,BufRead *.less setfiletype less syntax=css
    autocmd BufNewFile,BufRead *.scss setfiletype scss syntax=css
endif

