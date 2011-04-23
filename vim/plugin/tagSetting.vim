" tagSetting.vim, v1.0

" Default tags file locations
set tags=./tags,tags

" Map the command <Leader>tj to the generation of the tags file.
" Use ":stj tag_name" to split your window and jump to a particular
" class, method, variable, etc.
map <unique> <Leader>t <ESC>:call SetTags()<CR>
map <unique> <Leader>tj <ESC>:call SetTags()<CR>

" Sets the tags variable based upon which tags files
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
