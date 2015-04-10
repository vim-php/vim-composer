" ------------------------------------------------------------------------------
" Vim Composer                                                               {{{
"
" Author: Gianluca Arbezzano <gianarb92@gmail.com>
"
" Description:
" Run Composer from within Vim.
"
" Requires: Vim 6.0 or newer
"
" License: MIT
"
" }}}
" ------------------------------------------------------------------------------

if !exists("g:composer_cmd")
    if filereadable('./composer.phar')
        let g:composer_cmd='./composer.phar'
    else
        let g:composer_cmd='composer'
    endif
endif

command! -narg=* ComposerRun call s:ComposerRunFunc(<q-args>)

function! s:ComposerRunFunc(arg)
    let s:arg = a:arg
    exe "!".g:composer_cmd." ".s:arg
endfunction

