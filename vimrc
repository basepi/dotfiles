"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source:
"       http://github.com/crakdmirror/configs
"
" Author:
"       Colton Myers (crakdmirror)
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
" => Installation Instructions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Please see README.md for installation instructions


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Define installation-specific functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MySys function defines your system type.  Uncomment correct line
    function! MySys()
        return 'mac' " Mac is default, since it's what I use most
        " return 'windows'
        " return 'linux'
    endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands that need to be defined FIRST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader> keys must be defined before any commands which use them
" Map <leader> key
    let mapleader = ","
    let g:mapleader = ","

" Map <localleader> key
    let maplocalleader = ","
    let g:maplocalleader = ","


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
    if MySys() == "windows"
        autocmd! bufwritepost vimrc,.vimrc,_vimrc source C:\\vim\\_vimrc
    else
        autocmd! bufwritepost vimrc,.vimrc,_vimrc source ~/.vimrc
    endif

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
    set scrolloff=7
" Set 10 character side scroll-offset
    set sidescrolloff=10

" Status line
    " Always show the statusline
    set laststatus=2
    " Format the statusline
    set statusline=\ %{HasTabs()}%{HasPaste()}\ [%F%m%r%h]\ %w\ [CWD:\ %{CurDir()}]\ [Line:\ %l/%L:%c]

" Turn on wildmenu
    set wildmenu
" Setup tab completion modes
    set wildmode=list:longest,full
" Ignore when tab-completing
    set wildignore+=*.o,*.obj,.git,*.rbc,*~

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
    "set virtualedit=all

" Show matching code pieces (brackets, etc)
    set showmatch
" Length of time (tenths of second) to blink matching code piece
    set mat=2

" No sound or visual cues on errors
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500 " What does this do?

" Turn off vi compatibility
    set nocompatible

" Get rid of toolbar in gui mode
    set guioptions-=T

" Set tab label
    set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window Sizing and Split Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always keep windows at equal size except for winwidth/winheight of current
" window
    set equalalways

" When windows are split, new window appears on bottom
    set splitbelow
" When windows are vsplit, new window appears on right
    set splitright

" Set minimum winwidth
    set winwidth=81
" Set minimum winheight
    set winheight=40


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
    syntax on

" Set font (possibly implement system-specific later using a function?)
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10

" Set shell
    if MySys() != "windows"
        set shell=/bin/zsh
    endif

" Set terminal color-count
    set t_Co=256

" Set background color/style
    set background=dark

" Colorscheme
    colorscheme inkpot
    let g:inkpot_black_background = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable backups and swap files
    set backup
    set writebackup
    set swapfile

" Directories for swp files and backup (~) files
    if MySys() == "windows"
        set backupdir=C:\\vim\\vimfiles\\backup
        set directory=C:\\vim\\vimfiles\\backup
    else
        set backupdir=~/.vim/backup
        set directory=~/.vim/backup
    endif

" Set undo directory and enable undo file
    if MySys() == "windows"
        set undodir=C:\\vim\\vimfiles\\undodir
        set undofile
    else
        set undodir=~/.vim/undodir
        set undofile
    endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, Indent, and Whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't soft-wrap lines
    set nowrap

" Set textwidth for autoformatting (gq) to 80
    set textwidth=80

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

" Highlights related to tabs
    highlight TabWhitespace ctermbg=darkgray guibg=#101010
    match TabWhitespace /\t/

" Turn off column highlighting for all filetypes on BufEnter and BufLeave
    au BufEnter,BufLeave * set colorcolumn=
" Turn on column 81 highlighting for specified filetypes on BufEnter
    au BufEnter *.md,*.wp,*.c,*.h,*.cpp,*.cs,*.java,*.tex,*.m,*.C,*.H,*.M,README set colorcolumn=81
" Turn on column 73 highlighting for git commit messages
    au BufEnter COMMIT_EDITMSG set colorcolumn=73

" Define FileTypes which use normal tab characters instead of spaces
    au FileType make    set noexpandtab
    au FileType python  set noexpandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
    syntax on

" Set font (possibly implement system-specific later?  For now, install
"   Bitstream Vera Sans Mono on all systems.  Can be found here:
"   http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10

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
    " Search for some text recursively in the current working directory
    "   Assuming it works (and I've pulled in all the necessary bindings),
    "   should use <leader>cc to display all matches and <leader>n and
    "   <leader>p to traverse them.
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

" Use the arrows to something useful
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
" => Other key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map visual-mode spacebar to center screen on cursor
    nmap <space> zz

" Map visual- and insert-mode F1 to Esc to avoid accidental help calls
    map <F1> <Esc>
    imap <F1> <Esc>

" Map <leader>pp to toggle paste mode
    map <leader>pp :setlocal paste!<cr>

" Map <leader>bb to change to parent directory
    map <leader>bb :cd ..<cr>

" Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Move a line of text using ALT+[jk] or Command+[jk] on mac
    if MySys() == "mac"
        nmap <M-j> mz:m+<cr>`z
        nmap <M-k> mz:m-2<cr>`z
        vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
        vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
    endif

" Easy exit from insert mode using jj (often not available in
"   vim emulation plugins in IDEs, etc, so you might not want
"   to get reliant on this.)
    "inoremap jj <Esc>

" Easily toggle between tabs and spaces
    nmap <F3> :set expandtab!<CR>


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


" Set location for MRU plugin's file
    if MySys() == "windows"
        let MRU_file='C:\\vim\\vimfiles\\misc\\vim_mru_files'
    else
        let MRU_file='~/.vim/misc/vim_mru_files'
    endif


""""""""""""""""""""""""""""""
" => yankring plugin
""""""""""""""""""""""""""""""
" Map F11 to open a buffer showing the yankring
    nnoremap <silent> <F11> :YRShow<CR>
    if MySys() == "windows"
        let g:yankring_history_dir = 'C:\\vim\\vimfiles\\misc\\'
    else
        let g:yankring_history_dir = '~/.vim/misc/'
    endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing <leader>ss will toggle spell checking
    map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
" Define directories for vimgrep to skip
    let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'

" Define grep program (I don't know a built-in one for Windows,
"   so Windows will not define this.)
    if MySys() != "windows"
        set grepprg=/bin/grep\ -nH
    endif


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

" Get current working directory, abbreviating if in home directory (edit
"   home directory as necessary for your username, etc)
function! CurDir()
    if MySys() == "mac"
        let curdir = substitute(getcwd(), '/Users/crakdmirror/', "~/", "g")
    elseif MySys() == "windows"
        let curdir = substitute(getcwd(), 'C:\\Users\\crakdmirror\\', "~\\", "g")
    elseif MySys() == "linux"
        let curdir = substitute(getcwd(), '/home/crakdmirror/', "~/", "g")
    else
        let curdir = getcwd()
    endif

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

" Check for tabs (noexpandtab mode)
function! HasTabs()
    if &expandtab
        return ''
    else
        return '[TABS] '
    endif
endfunction

" Delete trailing whitespace (don't actually use, because I don't
"   know how good it is, and with this vimrc, trailing whitespace
"   is already highlighted, so I always delete it manually.  Might
"   be useful for using someone else's codebase, or when coming from
"   another editor.  Bind it to a key if you want!)
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
