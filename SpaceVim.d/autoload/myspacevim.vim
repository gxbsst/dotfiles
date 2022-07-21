function! myspacevim#after() abort

  let g:indent_blankline_char = ' '

  nmap <silent> gd <Plug>(coc-definition)


  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  set nopaste
  set termguicolors " this variable must be enabled for colors to be applied properly
  " COC相关
  vmap <leader>b <Plug>(coc-codeaction-selected)
  nmap <leader>b <Plug>(coc-codeaction-selected)
  call wilder#setup({'modes': [':', '/', '?']})
  call wilder#set_option('renderer', wilder#popupmenu_renderer({
        \ 'highlighter': wilder#basic_highlighter(),
        \ 'left': [
          \   ' ', wilder#popupmenu_devicons(),
          \ ],
          \ 'right': [
            \   ' ', wilder#popupmenu_scrollbar(),
            \ ],
            \ }))

  " Telescope相关
  lua require('telescope').load_extension('project')
  " Floatterm
  nnoremap <leader>n <cmd>FloatermNew<cr>

  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"
endfunction
