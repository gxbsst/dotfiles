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
  " Find files using Telescope command-line sugar.
  nnoremap <leader>f1 <cmd>Telescope find_files<cr>
  nnoremap <leader>ff <cmd>Telescope git_files<cr>
  nnoremap <leader>fg <cmd>Telescope git_status<cr>
  nnoremap <leader>ft <cmd>Telescope treesitter<cr>
  "nnoremap <leader>fG <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  " Using Lua functions
  nnoremap <leader>f1 <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader> ff <cmd>lua require('telescope.builtin').git_files()<cr>
  nnoremap <leader> fg <cmd>lua require('telescope.builtin').git_status()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

  nnoremap <leader>S :lua require('spectre').open()<CR>
  "search current word
  nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
  vnoremap <leader>s :lua require('spectre').open_visual()<CR>
  "  search in current file
  nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"
endfunction
