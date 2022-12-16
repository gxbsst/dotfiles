vim.keymap.set('n', '<Leader>rt', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>rtf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>rts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>rtl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>rtv', ':TestVisit<CR>')

vim.cmd([[
  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill'
    execute 'FloatermNew! '.a:cmd.' |less -X'
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
