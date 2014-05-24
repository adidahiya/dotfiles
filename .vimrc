filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Vundle setup
" =========================================================================
set shell=/bin/zsh
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vitality
let g:vitality_always_assume_iterm = 1

" Powerline
" let g:Powerline_stl_path_style = 'short'
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'sjl/vitality.vim'
Bundle 'scrooloose/syntastic'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'bling/vim-airline'
Bundle 'chriskempson/base16-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'myusuf3/numbers.vim'

" Config
" =========================================================================
set nocompatible
set laststatus=2          " Always show status line
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
set hidden                " Buffer is hidden when abandoned
set visualbell            " Visual indicator instead of system beep
" set cursorline            " Show vertical line underneath cursor
set clipboard=unnamed     " Use unnamed clipboard
set backspace=indent,eol,start
set history=1000
set undofile
set undoreload=10000
set nocp
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set autowrite
set shiftround
set autoread

" Invisibles
set list                      " show hidden chars
set listchars=tab:▸\ ,eol:¬   " symbols for hidden chars

" Font
set guifont=Inconsolata:h14

" vim-airline config
let g:airline_powerline_fonts=1

" Tabs, spaces, wrapping
" =========================================================================
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent        " copy indentation from previous line
set copyindent        " when autoindenting, copy indent format of prev line
set smartindent       " auto indent when it makes sense
set wrap              " make long lines (>80) wrap to next line
set textwidth=80      " line length
set formatoptions=qrn1

" Code folding
" =========================================================================
set foldcolumn=0
set foldlevel=0
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " don't fold by default

" Completion
" =========================================================================
set dictionary="/usr/share/dict/words"
set ofu=syntaxcomplete#Complete

" Color scheme
" =========================================================================
syntax on
set background=dark
" let g:badwolf_darkgutter=1    " dark bg for left gutter
colorscheme badwolf
" colorscheme tomorrow-night

set colorcolumn=80
" Color of ruler @ 80 col
highlight ColorColumn ctermbg=234

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Custom key bindings
" =========================================================================
" Navigate between split buffers
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" Open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Strip trailing whitespaces (,ss)
" =========================================================================
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

" Markdown Mode
" =========================================================================
function! MarkdownMode()
  set nolist
  set nonumber
  set spelllang=en_us
  set spell
endfunction
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call MarkdownMode()

if has("autocmd")
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .less, .scss files as .css
  autocmd BufNewFile,BufRead *.less setfiletype less syntax=css
  autocmd BufNewFile,BufRead *.scss setfiletype scss syntax=css
endif
