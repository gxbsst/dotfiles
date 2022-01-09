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

" let g:python_host_prog = '/Users/weston/.pyenv/shims/python'
" let g:python3_host_prog = '/Users/weston/.pyenv/shims/python3'
for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor


set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" nmap <silent> <C-l> <Plug>(jsdoc)


