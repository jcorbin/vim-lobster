" lobster.vim: Vim filetype plugin for Lobster.

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
