
" Common Settings
"""""""""""""""""""
set nocompatible
" set nowrap      " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set fileencodings=utf-8,cp936,gb18030,big5,ucs-bom,utf-16,iso-8859-1


" Mapping Settings
"""""""""""""""""""
" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nnoremap ; :
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

" Easy window navigation
map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

" Key mappings to ease browsing long lines
noremap  <C-j>       gj
noremap  <C-k>       gk
noremap  <Down>      gj
noremap  <Up>        gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk


" Plugin Settings 
"""""""""""""""""""
filetype plugin indent on
autocmd filetype python set expandtab
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()


" Style Settings
"""""""""""""""""""
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.





