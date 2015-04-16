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
        let g:composer_cmd='php ./composer.phar'
    else
        let g:composer_cmd='composer'
    endif
endif

command! -narg=* ComposerRun call s:ComposerRunFunc(<q-args>)
command! -narg=* ComposerInstall call s:ComposerRunFunc("install ".<q-args>)
command! ComposerGet call s:ComposerGetFunc()
command! ComposerJSON call s:OpenComposerJSON()

function! s:ComposerRunFunc(arg)
    let s:arg = a:arg
    exe "!".g:composer_cmd." ".s:arg
endfunction

function! s:ComposerGetFunc()
    exe "! curl -Ss https://getcomposer.org/installer | php"
endfunction

function! s:OpenComposerJSON()
    if filereadable("./composer.json")
        exe "vsplit ./composer.json"
    else
        echo "Composer json doesn't exist"
    endif
endfunction
