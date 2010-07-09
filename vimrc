set nocompatible
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=1000        " keep 1000 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search results

syntax on
set nowrap
filetype on
filetype plugin on
filetype indent on

:colorscheme railscasts
:cd ~
highlight OverLength guibg=#592929
match OverLength /\%81v.\+/
" http://items.sjbach.com/319/configuring-vim-right
set hidden
nnoremap ' `
nnoremap ` '
let mapleader=","
runtime macros/matchit.vim
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set hlsearch
nmap <silent> <leader>n :silent :nohlsearch<CR>
set listchars=tab:>-,trail:*,eol:$
nmap <silent> <leader>s :set nolist!<CR>
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <silent> <leader>t :FuzzyFinderTextMate<CR>
set shortmess=atI
