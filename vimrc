"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Colton Myers (crakdmirror)
"       http://github.com/crakdmirror
"       colton.myers@gmail.com
"
" Credits:
"       Many cool features I've implemented here were inspired by amix's vimrc,
"           blogged about at the following link:
"       http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
    set history=700

" Enable filetype plugin
    filetype plugin on
    filetype indent on

" Set to auto read when a file is changed from the outside
    set autoread

" When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vimrc

" Default file types
    set ffs=unix,mac,dos

" Try to set locale
    try
        lang en_US
    catch
    endtry

" Set encoding
    set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 line scroll-offset
    set so=7

" Status line
    " Always show the statusline
    set laststatus=2
    " Format the statusline
    set statusline=\ %{HasPaste()}\ [%F%m%r%h]\ %w\ [CWD:\ %{CurDir()}]\ [Line:\ %l/%L:%c]

" Turn on wildmenu
    set wildmenu
" Setup tab completion modes
    set wildmode=list:longest,full
" Ignore when tab-completing
    set wildignore+=*.o,*.obj,.git,*.rbc

" Turn on line numbers
    set number
" Always show current cursor position
    set ruler

" Set commandbar height
    set cmdheight=2

" Enable mouse in console
    set mouse=a

" Allow hiding buffers even though they contain modifications
" which have not yet been written back to the associated file
    set hid

" Set backspace config
    " Allow backspacing over everything in insert mode
    set backspace=eol,start,indent
    " Allow certain movement commands to wrap across linebreaks
    set whichwrap+=<,>,h,l

" Searching
    " Ignore case when searching
    set ignorecase
    " If search contains capital letter(s), case-sensitive search
    set smartcase
    " Enable search highlighting (disable by using "set nohl")
    set hlsearch
    " Search as you type (instant)
    set incsearch

" Don't redraw while executing macros
    set nolazyredraw

" Allows regex (pattern-matching) with special characters
    set magic

" Allow cursor to go out of the defined text boundaries
    set virtualedit=all

" Show matching code pieces (brackets, etc)
    set showmatch
" Length of time (tenths of second) to blink matching code piece
    set mat=2

" No sound or visual cues on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500 " What does this do?

" Turn off vi compatibility
    set nocompatible

" Get rid of toolbar in gui mode
    set guioptions-=T

" Set tab label
    set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
    syntax on

" Set font (possibly implement system-specific later using a function?)
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10

" Set shell
    set shell=/bin/zsh

" Set terminal color-count
    set t_Co=256

" Set background color/style
    set background=dark

" Colorscheme
    colorscheme inkpot


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable backups and swap files
    set backup
    set writebackup
    set swapfile

" Directories for swp files and backup (~) files
    set backupdir=~/.vim/backup
    set directory=~/.vim/backup

" Set undo directory and enable undo file
    set undodir=~/.vim/undodir
    set undofile

" Set location for MRU plugin file
    let MRU_file='~/.vim/misc/vim_mru_files'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, Indent, and Whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't soft-wrap lines
    set nowrap

" Set tabstop size
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

" Expand tabs to <tabstop> spaces instead of \t character
    set expandtab

" Enable smart indenting and autoindenting
    set smartindent
    set autoindent

" Highlight trailing whitespace (with support for buffer and
"   colorscheme matching)
" Also note that it won't highlight trailing whitespace on
"   a line currently being edited
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/

" Turn off column highlighting for all filetypes on BufEnter and BufLeave
    au BufEnter,BufLeave * set colorcolumn=
" Turn on column 81 highlighting for specified filetypes on BufEnter
    au BufEnter *.c,*.h,*.cpp,*.cs,*.java,*.tex,*.m,*.C,*.H,*.M,README set colorcolumn=81

" Define FileTypes which use normal tab characters instead of spaces
    au FileType make    set noexpandtab
    au FileType python  set noexpandtab

"Delete trailing white space, useful for Python ;)
    autocmd BufWrite *.py :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
    syntax on

" Set font (possibly implement system-specific later using a function?)
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10

" Set shell
    set shell=/bin/zsh

" Set terminal color-count
    set t_Co=256

" Set background color/style
    set background=dark

" Colorscheme
    colorscheme inkpot


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" In visual mode * or # will search for the current selection
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSearch('gv')<CR>
    " What does this mapping do?
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <leader><cr> to no highlight (clear highlight after search)
    map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

" Close the current buffer
    map <leader>bd :Bclose<cr>
    command! Bclose call <SID>BufcloseCloseIt()

" Close all the buffers
    map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
    map <right> :bn<cr>
    map <left> :bp<cr>

" Tab configuration
    map <leader>tn :tabnew<cr>
    map <leader>te :tabedit
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>

" Specify the behavior when switching between buffers
    try
        " Tell vim to first search the tab and window list for requested buffer
        set switchbuf=usetab
        " Always show tab bar
        set stal=2
    catch
    endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map visual-mode spacebar to center screen on cursor
    nmap <space> zz

" Map visual- and insert-mode F1 to Esc to avoid accidental help calls
    map <F1> <Esc>
    imap <F1> <Esc>

" Map <leader> key
    let mapleader = ","
    let g:mapleader = ","

" Map <leader>pp to toggle paste mode
    map <leader>pp :setlocal paste!<cr>

" Map <leader>bb to change to parent directory (I think)
    map <leader>bb :cd ..<cr>

" Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut for the date/time
    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
    map <leader>cc :botright cope<cr>
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
    let MRU_Max_Entries = 400
    map <leader>f :MRU<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing <leader>ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper function called by the VisualSearch() function
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Search function
"   If you pass 'gv' parameter, will vimgrep after selected text
"   If you pass 'f' or 'b' parameters, will search for current selection
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Function used to close the current buffer
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
     buffer #
    else
     bnext
    endif

    if bufnr("%") == l:currentBufNum
     new
    endif

    if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Get current working directory, abbreviating if in home directory
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/crakdmirror/', "~/", "g")
    return curdir
endfunction

" Check for paste mode
function! HasPaste()
    if &paste
        return '[PASTE MODE]'
    else
        return ''
    endif
endfunction

" Delete trailing whitespace (how good is this?)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Possible alternate configuration stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"##################FOR USE WITH VIM <7.3 ######################
" 80-character limit highlighting for vim <7.3 Replace colorcolumn commands with
"   the following commands
    " Highlight 78-80 in 'Search' color
    "au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)

    " Highlight past column 80 in 'ErrorMsg' color
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
