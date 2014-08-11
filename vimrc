" First, you need to copy this file to ~/.vimrc and do:
" 
"   git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
"
" then you should open VIM and run :PluginInstall


" Common Settings
"""""""""""""""""""
set nocompatible
syntax on
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
"set nowrap         " don't wrap lines
set complete-=i     " don't search included file for autocompletion
set complete-=d     " don't search directory for autocompletion
set complete-=k     " don't search dict for autocompletion
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set nonumber        " hide line numbers
"set mouse=a        " enable mouse
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set ruler           " show cursor position
set smartcase       " ignore case if search pattern is all lowercase,
                    " case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to
                    " shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
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

" tab switching
noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt
noremap <D-9> 10gt
noremap <D-S-right> gt
noremap <D-S-left> gT

" misc
nnoremap ; :
map <leader>pp :setlocal invpaste<cr>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>n :set invnumber<CR>
cmap w!! w !sudo tee % >/dev/null

" vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

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

" Vundle Begin 
""""""""""""""""
set runtimepath+=~/.vim/vundle.git/
call vundle#begin()

" Plugin 'mayansmoke'

" solarized colorscheme
" Plugin 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

Plugin 'zeis/vim-kolor'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'Align'
Plugin 'YankRing.vim'
nnoremap <silent> <Leader>yy :YRShow<CR>

Plugin 'mru.vim'
nmap <silent> <Leader>rr :MRU<CR>

" Plugin 'Conque-Shell'
" nmap <silent> <Leader>vt <CR>:ConqueTermTab bash<CR>
" let g:ConqueTerm_CloseOnEnd = 1

Plugin 'Indent-Guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1 

Plugin 'EasyMotion'
let g:EasyMotion_do_shade = 0
let g:EasyMotion_leader_key = '<Leader>m' 

" FuzzyFinder
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" nmap <leader>fb  :FufBuffer<CR>
" nmap <leader>fc  :FufDirWithCurrentBufferDir<CR>
" nmap <leader>fd  :FufDir<CR>
" nmap <leader>ff  :FufFile<CR>

" tComment
Plugin 'tComment'
nnoremap <leader>cc :TComment<CR>
vnoremap <leader>cc :TComment<CR>

" " Command-T
" Plugin 'http://github.com/wincent/Command-T'
" let g:CommandTCancelMap=['<ESC>','<C-c>']
" let g:CommandTMatchWindowAtTop=1
" nmap <silent> <Leader>ff :CommandT<CR>
" nmap <silent> <Leader>fb :CommandTBuffer<CR>


" taglist
Plugin 'vim-scripts/taglist.vim'
let Tlist_Ctags_Cmd='/Users/cnhacktnt/homebrew/Cellar/ctags/5.8/bin/ctags'
nnoremap <leader>ct  :TlistToggle <CR>

" TagBar
Plugin 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>

" CtrlP
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Neocomplcache
" Plugin 'http://github.com/Shougo/neocomplcache.vim'
" let g:neocomplcache_enable_at_startup = 1

Plugin 'Valloric/YouCompleteMe.git'


" perlomni
" Plugin 'c9s/perlomni.vim'

" tabber
Plugin 'fweep/vim-tabber.git'
set tabline=%!tabber#TabLine()

let g:tabber_wrap_when_shifting = 1

" nnoremap <silent> <C-t>            :999TabberNew<CR>
" nnoremap <silent> <Leader><Leader> :TabberSelectLastActive<CR>
" nnoremap <silent> <Leader>tn       :TabberNew<CR>
" nnoremap <silent> <Leader>tm       :TabberMove<CR>
nnoremap <silent> <Leader>tn       :tabnew<CR>
nnoremap <silent> <Leader>tc       :tabclose<CR>
" nnoremap <silent> <Leader>tl       :TabberShiftLeft<CR>
" nnoremap <silent> <Leader>tr       :TabberShiftRight<CR>
" nnoremap <silent> <Leader>ts       :TabberSwap<CR>
nnoremap <silent> <Leader>1        :tabnext 1<CR>
nnoremap <silent> <Leader>2        :tabnext 2<CR>
nnoremap <silent> <Leader>3        :tabnext 3<CR>
nnoremap <silent> <Leader>4        :tabnext 4<CR>
nnoremap <silent> <Leader>5        :tabnext 5<CR>
nnoremap <silent> <Leader>6        :tabnext 6<CR>
nnoremap <silent> <Leader>7        :tabnext 7<CR>
nnoremap <silent> <Leader>8        :tabnext 8<CR>
nnoremap <silent> <Leader>9        :tabnext 9<CR>

call vundle#end()

""""""""""""""
" Vundle END 

filetype plugin indent on
filetype plugin on
au BufRead,BufNewFile *.lbi,*.dwt setfiletype html


" GUI Settings
if has('gui_running')
    " colorscheme mayansmoke
    colorscheme desert
    set nu
    set go-=T
    set guifont=Monaco:h12
    " hi CursorLine guibg=gray90
    " hi StatusLine guibg=#707070
    set cursorline
    "set background=dark
endif



