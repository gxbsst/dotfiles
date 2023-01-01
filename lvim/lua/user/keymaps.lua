local keyset = vim.keymap.set
-- Easy insertion of a trailing ; or , from insert mode.
keyset('i', ';;', '<Esc>A;')
keyset('i', ',,', '<Esc>A,')
-- terminal
keyset('n', '<F9>', '<cmd>terminal<cr>')

-- 使ctrl+f 和 ctrl+b正常工作
keyset({ 'n', 'i' }, '<C-b>', '<Left>')
keyset({ 'n', 'i' }, '<C-f>', '<Right>')

-- outline
-- keymaps = { -- These keymaps can be a string or a table for multiple keys
--    close = {"<Esc>", "q"},
--    goto_location = "<Cr>",
--    focus_location = "o",
--    hover_symbol = "<C-space>",
--    toggle_preview = "K",
--    rename_symbol = "r",
--    code_actions = "a",
--    fold = "h",
--    unfold = "l",
--    fold_all = "W",
--    unfold_all = "E",
--    fold_reset = "R",
--  },
vim.keymap.set('n', '<F7>', '<cmd>SymbolsOutline<cr>')
-- buffer
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"


-- KEYMPAPS BINDING
local opts = { silent = true, nowait = true }
vim.keymap.set("n", "<F2>", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  opts)
vim.keymap.set("n", "<F11>", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<F3>", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("v", "<F3>", function() vim.lsp.buf.code_action() end, opts)

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Buffer
-- vim.keymap.set('n', '<C-n>', ":bnext<CR>")
-- vim.keymap.set('n', '<C-p>', ":bprev<CR>")

-- Quit
vim.keymap.set('n', 'q', ':q<CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', 'J', ':move .+1<CR>==')
vim.keymap.set('n', 'L', ':move .-2<CR>==')
vim.keymap.set('v', 'j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")
-- Telescope
vim.keymap.set('n', ',km', "<cmd>Telescope keymaps<CR>")
vim.keymap.set('n', '<C-o>', "<cmd>Telescope git_files<CR>")
vim.keymap.set('n', '<C-F>',
  [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<C-b>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<C-g>', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<C-e>', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<C-s>', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set('n', '<C-r>', ":Telescope npm scripts<CR>")
local default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('v', '<C-g>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)

opts = { remap = false }
vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.hover() end, opts)

-- Quit
vim.keymap.set('n', 'q', ':q<CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', 'J', ':move .+1<CR>==')
vim.keymap.set('n', 'L', ':move .-2<CR>==')
vim.keymap.set('v', 'j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")
-- Telescope
vim.keymap.set('n', ',km', "<cmd>Telescope keymaps<CR>")
vim.keymap.set('n', '<C-o>', "<cmd>Telescope git_files<CR>")
-- vim.keymap.set('n', '<C-F>',
--   [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<C-p>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<C-g>', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<C-e>', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<C-s>', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set('n', '<C-r>', ":Telescope npm scripts<CR>")
default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('v', '<C-g>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)

opts = { remap = false }
vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.hover() end, opts)

-- Buffer
-- vim.keymap.set('n', '<C-n>', ":bnext<CR>")
-- vim.keymap.set('n', '<C-p>', ":bprev<CR>")
