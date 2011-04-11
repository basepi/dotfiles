" tagSetting.vim, v1.0

" Default tags file locations
set tags=./tags,tags

" Map the command <Leader>t to the generation of the tags file.
" Use ":stj tag_name" to split your window and jump to a particular
" class, method, variable, etc.
map <unique> <Leader>t <ESC>:call SetTags()<CR>
map <unique> <Leader>tj <ESC>:call SetTags()<CR>
map <unique> <Leader>tg <ESC>:call GenerateTags()<CR>

" Sets the tags variable based upon which jtags files
" it finds in the current directory path
function! SetTags()
    " set shellslash so we can use the forward
    " slash everywhere instead of DOS' backslash
    setlocal shellslash 
    let l:separator = "/"

    " by convention I name my tags file jtags,
    " but tags is more commonly used.
    let l:tagfile = "tags"
    let l:taglist = "./tags,tags"

    let l:dname = getcwd()
    while isdirectory(l:dname)
        let l:fname = l:dname . l:separator . l:tagfile
        if filereadable(l:fname)
            " add to list of tag files
            let l:taglist = l:taglist . "," . l:fname
        endif
        let l:dname = strpart(l:dname, 0, strridx(l:dname, l:separator))
        echo "searching " l:dname
    endwhile
    execute 'set tags=' . escape(l:taglist, " ")
    set tags
    setlocal shellslash<
endfunction

function! GenerateTags()
    " set shellslash so we can use the forward
    " slash everywhere instead of DOS' backslash
    setlocal shellslash 
    let l:separator = "/"

    " choose a file that signifies we're at the
    " top of the directory structure.  Ant's
    " build.xml is a good choice for me.
    let l:keyfile = "build.xml"

    " set to the name of the directory or
    " directories that contain the source files
    " to run ctags on
    let l:sourceDirs = "src"

    " set to the name of the tags file to create
    let l:tagfile = "tags"

    let l:dname = getcwd()
    while isdirectory(l:dname)
        let l:fname = l:dname . l:separator . l:keyfile
        if filereadable(l:fname)
            " found spot for tags file
            let l:dname = escape(l:dname, " ")
            let result = delete(l:dname . l:separator . l:tagfile)
            execute '!cd ' . l:dname . " && ctags -Rf " . l:tagfile . " " . l:sourceDirs
            break
        endif
        let l:dname = strpart(l:dname, 0, strridx(l:dname, l:separator))
        echo "searching" l:dname "for" l:keyfile
    endwhile
    setlocal shellslash<
endfunction

