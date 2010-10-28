" Common Settings
"""""""""""""""""""
set nocompatible
syntax on
colorscheme desert
" set nowrap      " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set mouse=a       " enable mouse
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set ruler         " show cursor position
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
set encoding=utf-8
set tenc=utf-8
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/cnhacktnt/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


" Mapping Settings
"""""""""""""""""""

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Key mappings to ease browsing long lines
" noremap  <C-J>       gj
" noremap  <C-K>       gk
noremap  <Down>      gj
noremap  <Up>        gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk

" windows nagivationg
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" misc
nnoremap ; :
map <leader>pp :setlocal invpaste<cr>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

" Style Settings
"""""""""""""""""""
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'


" Plugin Settings
""""""""""""""""""
filetype plugin indent on
autocmd filetype python set expandtab
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
" autocmd filetype html,xml set listchars-=tab:>.

" ctaglist
let Tlist_Ctags_Cmd="/Users/cnhacktnt/homebrew/Cellar/ctags/5.8/bin/ctags"
nnoremap <leader>tl  :TlistToggle <CR>

" fuzzyfinder
map <leader>fb  :FufBuffer <CR>
map <leader>fc  :FufDirWithCurrentBufferDir <CR>
map <leader>fd  :FufDir <CR>
map <leader>ff  :FufFile <CR>


