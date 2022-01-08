inoremap <silent><expr> <c-space> coc#refresh()

call coc#config('coc.preferences', {
			\ "autoTrigger": "always",
			\ "maxCompleteItemCount": 10,
			\ "codeLens.enable": 1,
			\ "diagnostic.virtualText": 1,
			\})


call coc#config('coc.source', {
			\ "ultisnips.filetypes": ["html", "javascript", "css"],
			\})

let s:coc_extensions = [
			\ 'coc-dictionary',
			\ 'coc-json',
			\ 'coc-ultisnips',
			\ 'coc-tag',
			\ 'coc-snippets',
			\ 'coc-css',
			\ 'coc-prettier',
			\ 'coc-jest',
			\ 'coc-eslint',
			\ 'coc-wxml',
			\ 'coc-emmet',
			\]

" brew install bdw-gc
" let g:python_host_prog = '/Users/weston/.pyenv/versions/2.7.18/bin/python'
" let g:python3_host_prog = '/Users/weston/.pyenv/versions/3.9.4/bin/python'
for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor


set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" nmap <silent> <C-l> <Plug>(jsdoc)

inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"


" call wilder#setup({'modes': [':', '/', '?']})
"
" call wilder#set_option('pipeline', [
      " \   wilder#branch(
      " \     wilder#cmdline_pipeline(),
      " \     wilder#search_pipeline(),
      " \   ),
      " \ ])
"
" call wilder#set_option('renderer', wilder#wildmenu_renderer({
      " \ 'highlighter': wilder#basic_highlighter(),
      " \ }))


call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': has('nvim'),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))

vmap <leader>b <Plug>(coc-codeaction-selected)
nnoremap <leader>b <Plug>(coc-codeaction-selected)

" ========= gitblame settings ==========
let g:gitblame_enabled = 1
let g:gitblame_message_template = '     ◆ <summary> • <date> • <author>     '
let g:gitblame_date_format = '%r'
" let g:gitblame_highlight_group = "Question"
highlight default link Visual default

nnoremap <leader>S :lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

