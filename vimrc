" First, you need to copy this file to ~/.vimrc and do:
" 
"   git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
"
" then you should open VIM and run :BundleInstall
"
" If you are using customized ruby installed by rvm like I do,
" you should also run:
"
"   cd ~/.vim/bundle/Command-T/ruby/command-t
"   ruby extconf.rb
"   make

set runtimepath+=~/.vim/vundle.git/

" Common Settings
"""""""""""""""""""
set nocompatible
syntax on
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
" set nowrap      " don't wrap lines
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set nonumber      " hide line numbers
" set mouse=a       " enable mouse
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
set encoding=utf8
set fileencodings=utf8,cp936,gb18030,big5,iso-8859-1
set tenc=utf8
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" for statusline
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

" restore the last editing position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


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
set expandtab


" Plugin Settings
""""""""""""""""""
" autocmd filetype python set expandtab
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
" autocmd filetype html,xml set listchars-=tab:>.

filetype off

" Vundle Settings " {{{
call vundle#rc()

" solarized colorscheme
Bundle "http://github.com/altercation/vim-colors-solarized"
Bundle "http://github.com/msanders/snipmate.vim"
Bundle "http://github.com/tpope/vim-surround"
Bundle "Align"
Bundle "mru.vim"
nmap <silent> <Leader>rr :MRU<CR>

" FuzzyFinder
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" nmap <leader>fb  :FufBuffer<CR>
" nmap <leader>fc  :FufDirWithCurrentBufferDir<CR>
" nmap <leader>fd  :FufDir<CR>
" nmap <leader>ff  :FufFile<CR>

" tComment
Bundle 'tComment'
nnoremap <leader>cc :TComment<CR>
vnoremap <leader>cc :TComment<CR>

" Command-T
Bundle "http://github.com/wincent/Command-T"
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMatchWindowAtTop=1
nmap <silent> <Leader>ff :CommandT<CR>
nmap <silent> <Leader>fb :CommandTBuffer<CR>


" taglist
Bundle 'http://github.com/vim-scripts/taglist.vim'
let Tlist_Ctags_Cmd="/Users/cnhacktnt/homebrew/Cellar/ctags/5.8/bin/ctags"
nnoremap <leader>ct  :TlistToggle <CR>

" }}}

filetype plugin indent on


" GUI Settings
if has('gui_running')
    set go-=T
    set guifont=Monaco:h12
    set background=dark
    colorscheme solarized
endif


