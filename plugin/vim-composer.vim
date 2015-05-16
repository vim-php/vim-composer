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
command! -narg=* ComposerInstall call s:ComposerInstallFunc(<q-args>)
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

if !exists("g:composer_install_callback")
    let g:composer_install_callback = ""
endif

function! s:ComposerInstallFunc(arg)
    exe s:ComposerRunFunc("install")
    if len(g:composer_install_callback) > 0
        exe "call ".g:composer_install_callback."()"
    endif
endfunction

function! s:ComposerKnowWhereCurrentFileIs()
    let l:currentWord = explode('<cword>')
    exec "!grep ClassNameToFind ../onebip/vendor/composer -R | awk '{print $6}' | awk -F\' '{print $2}'"
endfunction
