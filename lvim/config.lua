--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- fold 代码折叠
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"

vim.g.noautochdir = true


-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- lualine
-- lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.sections.lualine_c = { "diff" }

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["S"] = ":w<cr>"

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')
-- terminal
vim.keymap.set('n', '<F9>', '<cmd>terminal<cr>')
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

-- search
-- find and replace
lvim.builtin.which_key.mappings["sS"] = { "<cmd>lua require('spectre').open()<CR>", "find and replace" }

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["gS"] = { "<cmd>Telescope git_status<CR>", "Git Status" }
-- Command
lvim.builtin.which_key.mappings["C"] = { "<cmd>Telescope command_center<CR>", "Command Center" }
-- 项目
lvim.builtin.which_key.mappings["p"] = {
  name = "Project",
  mb = { ":!cd /Users/weston/Projects/WOSAI/FRONTEND/merchant-mp-default && cli --project `pwd` build-npm<CR>",
    "商家小程序build npm" },
}
-- 警告提示
lvim.builtin.which_key.mappings["E"] = {
  name = "Error & Warning",
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
-- 测试
lvim.builtin.which_key.mappings["t"] = {
  name = 'Test',
  t = { '<cmd>TestNearest<CR>', "TestNearest" },
  f = { "<cmd>TestFile<CR>", "TestFile" },
  s = { "<cmd>TestSuite<CR>", "TestSuite" },
  l = { "<cmd>TestLast<CR>", "TestLast" },
  v = { "<cmd>TestVisit<CR>", "TestVisit" },
  j = { "<cmd>lua require'jester'.debug()<CR>", "Debug nearest test(s) under the cursor" },
  J = { "<cmd>lua require'jester'.debug_file()<CR>", "Debug current file" },
}

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.update_focused_file = { update_cwd = false, update_focused_file = false, enable = false,
  update_root = false,
  ignore_list = { "package.json", }
}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- lvim.builtin.project.active = true
-- lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.detection_methods = nil
-- lvim.builtin.nvimtree.setup.actions.change_dir = {
--enable = false,
---global = false,
-- }
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
lvim.builtin.nvimtree.setup.update_cwd = false

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua" },
  {
    command = "prettier",
    -- extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- {
  --   "airblade/vim-rooter"
  -- },
  {
    "terryma/vim-multiple-cursors"
  },
  -- Command
  {
    "FeiyouG/command_center.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("command_center")
      local command_center = require("command_center")
      command_center.add({
        {
          desc = "编译商家小程序npm",
          cmd = "<CMD>:!cd /Users/weston/Projects/WOSAI/FRONTEND/merchant-mp-default && cli --project `pwd` build-npm<CR>",
        }
      })
    end
  },
  -- KEYMAPS
  -- LSP
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup({
        -- auto_preview = false,
        autofold_depth = 1,
        -- auto_close = true,
      })
    end
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  -- GIT
  { 'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
    config = function() end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  -- CODE
  {
    "echasnovski/mini.map",
    branch = "stable",
    config = function()
      require('mini.map').setup()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = 'DiagnosticFloatingError',
            warn  = 'DiagnosticFloatingWarn',
            info  = 'DiagnosticFloatingInfo',
            hint  = 'DiagnosticFloatingHint',
          }),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot('4x2'),
        },
        window = {
          side = 'right',
          width = 20, -- set to 1 for a pure scrollbar :)
          winblend = 15,
          show_integration_count = false,
        },
      })
    end
  },
  -- TEXT
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { 'prettier/vim-prettier' },
  { 'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
        -- experimental features:
        virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end },
  -- TEST
  {
    'vim-test/vim-test',
    config = function()
    end,
  },
  { 'David-Kunz/jester' },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
    config = function()
      require("neotest").setup({
        adapters = {

        },
      })
    end
  },
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
      vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
      vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]] )
    end
  },
  -- WX
  { 'chemzqm/wxapp.vim' },
  { 'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
        'less',
        'css';
        'javascript';
        html = {
          mode = 'foreground';
        }
      }
    end
  },
  -- TEXT Align
  { 'junegunn/vim-easy-align' },
  -- NPM
  { 'elianiva/telescope-npm.nvim' },
  -- 错误开关
  { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' },
  -- Window Zoom
  --  use <C-w>m
  { 'dhruvasagar/vim-zoom' },
  { 'christoomey/vim-tmux-navigator' },
  { "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = 120,
          options = {
            number = true,
            relativenumber = true,
          }
        },
      }

      vim.keymap.set("n", "<leader>zz", function()
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
    end
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
-- Telescope
-- lvim.builtin.telescope.defaults.initial_mode = "insert"
-- lvim.builtin.telescope.defaults.layout_config.horizontal.mirror = true
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
-- lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
-- lvim.builtin.telescope.defaults.layout_config.vertical.mirror = true
-- lvim.builtin.telescope.defaults.layout_strategy = "horizontal"

-- UI
-- lvim.transparent_window = true

-- KEYMPAPS BINDING
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

local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.hover() end, opts)
-- NvimTree
-- 默认打开 NvimTreeOpen
vim.schedule(function()
  vim.cmd "noautocmd NvimTreeOpen"
end)

-- -- DAP CONFIG
lvim.builtin.dap.active = true

local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

dap.configurations.vue = { -- change this to javascript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

-- dap.configurations.javascriptreact = { -- change this to javascript if needed
--     {
--      type = 'node2',
--     request = 'launch',
--     cwd = vim.fn.getcwd(),
--     runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
--     args = { '--no-cache' },
--     sourceMaps = false,
--     protocol = 'inspector',
--     skipFiles = {'<node_internals>/**/*.js'},
--     console = 'integratedTerminal',
--     port = 9229,
--     disableOptimisticBPs = true
--     }
-- }

-- 编译商家小程序npm
vim.api.nvim_create_user_command('BuildMerchantNPM', function()
  vim.api.nvim_command(":!cd /Users/weston/Projects/WOSAI/FRONTEND/merchant-mp-default && cli --project `pwd` build-npm")
end, {})

require("project_nvim").setup {
  manual_mode = true,
  patterns = { ".git" },

  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
