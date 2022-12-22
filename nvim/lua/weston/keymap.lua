-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
  vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
-- vim.keymap.set('n', 'q:', ':q')
vim.keymap.set('n', 'q', ':q<CR>')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', 'J', ':move .+1<CR>==')
vim.keymap.set('n', 'K', ':move .-2<CR>==')
vim.keymap.set('v', 'j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- toggle
-- toggle foldcolumn
vim.keymap.set('n', ',tf', ":set foldcolumn=1<CR>")

-- buffer
vim.keymap.set('n', '<C-n>', ":bnext<CR>")
vim.keymap.set('n', '<C-p>', ":bprev<CR>")

-- find replace
vim.keymap.set('n', '<leader>S', require('spectre').open, {desc = "hello"})
-- vim.keymap.set('v', '<leader>S1', require('spectre').open_visual, {desc = "hello" })
-- vim.keymap.set('n', '<leader>S2', require('spectre').open_visual, {desc = "hello"})
-- vim.keymap.set('n', '<leader>S3', require('spectre').open_file_search, {desc = "hello"})

-- COC
local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- keyset("n", "<F11>", "<Plug>(coc-diagnostic-next)", {silent = true})
-- keyset("n", "<F2>", "<Plug>(coc-diagnostic-prev-error)", {silent = true})
-- keyset("n", "<F2>", "<Plug>(coc-diagnostic-next-error)", {silent = true})

local opts = {silent = true, nowait = true}

-- -- keyset("x", "<enter>", "<Plug>(coc-codeaction-selected)", opts)
-- keyset("x", "<F3>", "<Plug>(coc-codeaction-selected)", opts)

-- keyset("n", "<F4>", "<Plug>(coc-codeaction-cursor)", opts)
-- keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
-- keyset("n", "<leader><TAB>", "<Plug>(coc-range-select)", opts)
-- keyset("n", "<leader>cf", "<Plug>(coc-fix-current)", opts)
-- keyset("n", ",cre", "<Plug>(coc-codeaction-refactor)", { silent = true })
-- keyset("x", ",cr", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-- keyset("n", ",cr", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-- keyset("n", ",cl", "<Plug>(coc-codelens-action)", opts)
-- keyset("n", ",cd", "<Plug>(coc-float-jump)", opts)

-- TEXT
-- ALIGN
keyset("x", "<leader>ta", "<Plug>(EasyAlign)", {silent = true })
-- FORMAT
keyset("n", "<leader>tf", vim.lsp.buf.format)
-- keyset("n", "<leader>tf", vim.lsp.buf.formatting, {silent = true})
-- keyset("v", "<leader>tf", vim.lsp.buf.formatting, {silent = true})
keyset("n","S", ":w<CR>")



