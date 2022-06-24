function! myspacevim#after() abort

  let g:indent_blankline_char = ' '

  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  set nopaste
endfunction
