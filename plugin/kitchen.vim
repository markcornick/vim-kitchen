" kitchen.vim - basic vim/kitchen integration
" Maintainer: Mark Cornick <https://github.com/markcornick>

if exists("g:loaded_kitchen") || v:version < 700 || &cp || !executable('kitchen')
  finish
endif
let g:loaded_kitchen = 1

function! s:commands(A, L, P)
  return "console\nconverge\ncreate\ndestroy\ndiagnose\ndriver\nhelp\ninit\nlist\nlogin\nsetup\ntest\nverify\nversion"
endfunction

augroup kitchen
  autocmd!
  autocmd VimEnter *
        \ command! -nargs=+ -complete=custom,s:commands Kitchen execute '!kitchen '.<q-args>
augroup END

" vim:set et sw=2:

