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
keyset('n', '<F7>', '<cmd>SymbolsOutline<cr>')
-- buffer
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- Floatterm
keyset('n', '<F1>', ':FloatermToggle<CR>')
keyset('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')

-- KEYMPAPS BINDING
local opts = { silent = true, nowait = true }
keyset("n", "<F2>", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  opts)
keyset("n", "<F11>", function() vim.diagnostic.goto_prev() end, opts)
keyset("n", "<F3>", function() vim.lsp.buf.code_action() end, opts)
keyset("v", "<F3>", function() vim.lsp.buf.code_action() end, opts)

-- Quickly clear search highlighting.
keyset('n', '<Leader>k', ':nohlsearch<CR>')

-- Buffer
-- keyset('n', '<C-n>', ":bnext<CR>")
-- keyset('n', '<C-p>', ":bprev<CR>")

-- Quit
keyset('n', 'q', ':q<CR>')

-- Move lines up and down.
keyset('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
keyset('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
keyset('n', 'J', ':move .+1<CR>==')
keyset('n', 'L', ':move .-2<CR>==')
keyset('v', 'j>', ":move '>+1<CR>gv=gv")
keyset('v', '<A-k>', ":move '<-2<CR>gv=gv")
-- Telescope
-- git
keyset('n', ',km', "<cmd>Telescope keymaps<CR>")
keyset('n', '<C-o>', "<cmd>Telescope git_files<CR>")
-- command center
keyset('n', ',c', "<cmd>Telescope command_center<CR>")
-- LSP
keyset("n", ',d', "<cmd>Lspsaga lsp_finder<CR>")
opts = { remap = false }
-- keyset("n", "<C-i>", function() vim.lsp.buf.hover() end, opts)
-- LSPSaga prefix - [;]
keyset("n", ",f", [[<cmd>Lspsaga lsp_finder<CR>]])
-- Code action
keyset({ "n", "v" }, ',a', "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Rename
keyset("n", ',r', "<cmd>Lspsaga rename<CR>", { silent = true })
keyset("n", ',p', "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keyset("n", ',e', "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keyset("n", ',E', "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
-- Diagnostic jump can use `<c-o>` to jump back
keyset("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keyset("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
-- Only jump to error
keyset("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keyset("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- Outline
keyset("n", ",o", "<cmd>LSoutlineToggle<CR>", { silent = true })
-- Hover Doc
keyset("n", "<C-i>", "<cmd>Lspsaga hover_doc<CR>", { silent = true, remap = true })
-- Quit
keyset('n', 'q', ':q<CR>')
-- Telescope
keyset('n', '<leader>p', '<cmd>Telescope<CR>')
keyset('n', '<C-F>',
  [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
keyset('n', '<C-b>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
-- keyset('n', '<C-g>', ":Telescope live_grep<CR>")
keyset('n', '<C-g>',
  [[<cmd>lua require('telescope.builtin').live_grep({ theme = 'ivy', layout_strategy='horizontal',layout_config={width=0.5}})<CR>]])
-- keyset('v', '<C-g>',
--   [[<cmd>y<ESC>lua require('telescope.builtin').live_grep({ default_text =<cr>0, theme = 'ivy', layout_strategy='horizontal',layout_config={width=0.5}})<CR>]])
keyset('n', '<C-e>', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keyset('n', '<C-s>', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
keyset('n', '<C-r>', ":Telescope npm scripts<CR>")
local default_opts = { noremap = true, silent = true }
-- keyset('v', '<C-g>', "y<ESC>:lua require('telescope.builtin').live_grep({ default_text ='aa' ,theme = 'ivy', layout_strategy='horizontal',layout_config={width=0.5}})<CR>", default_opts)
keyset('v', '<C-g>',
  'y<ESC>:Telescope live_grep default_text=<c-r>0 layout_strategy=horizontal theme=ivy layout_config={"width":0.8}<CR>',
  default_opts)
keyset('n', ',km', '<cmd>Telescope keymaps layout_strategy=horizontal theme=ivy layout_config={"width":0.8}<CR>')
keyset('n', '<C-o>', '<cmd>Telescope git_files layout_strategy=horizontal theme=ivy layout_config={"width":0.8}<CR>')
-- keyset('n', '<C-F>',
--   [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
-- keyset('n', '<C-p>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
-- default_opts = { noremap = true, silent = true }
-- keyset('v', '<C-g>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)

-- Buffer
-- keyset('n', '<C-n>', ":bnext<CR>")
-- keyset('n', '<C-p>', ":bprev<CR>")

-- Zenmode
keyset("n", "<leader>zz", function()
  require("zen-mode").toggle({
    window = {
      width = 120,

      options = {
        number = true,
        relativenumber = true,
      }
    }
  })
  vim.wo.wrap = true
  -- ColorMyPencils()
end)
