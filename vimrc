" /DUH/ settings
    set nocompatible
    set number
    set ruler
    syntax on

" Set encoding
    set encoding=utf-8

" Whitespace stuff
    set nowrap
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smartindent
    set autoindent

    " Highlight trailing whitespace
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/

    " Turn off column highlighting for all filetypes on BufEnter and BufLeave
    au BufEnter,BufLeave * set colorcolumn=
    " Turn on column highlighting for specified filetypes
    au BufEnter *.c,*.h,*.cpp,*.cs,*.java,*.tex,*.m,*.C,*.H,*.M,README set colorcolumn=81

    " Allow cursor to go out of the defined text boundaries
    set virtualedit=all

" Searching
    set nohls
    set incsearch
    set ignorecase
    set smartcase

" Tab completion
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
    set laststatus=2

" make and python use real tabs
    au FileType make    set noexpandtab
    au FileType python  set noexpandtab

" Allow backspacing over everything in insert mode
    set backspace=indent,eol,start

" Show matching code piece (bracket, etc)
    set showmatch

" Get rid of toolbar in gui mode
    set guioptions-=T

" Directories for swp files
    set backup
    set writebackup
    set swapfile
    set backupdir=~/.vim/backup
    set directory=~/.vim/backup

" Disable beeping and flashing
    set vb t_vb=

" Colorscheme
    colorscheme inkpot

" Keybindings
    nmap <space> zz
    map <F1> <Esc>
    imap <F1> <Esc>

" Scripts
    source ~/.vim/plugin/a.vim

"#######################STUFF FOR USE WITH VIM <7.3 ############################
    " Highlight 78-80 in 'Search' color
    "au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)

    " Highlight past column 80 in 'ErrorMsg' color
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
