return {
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    config = function()
      require('bufferline').setup {}
    end
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    config = function()
      require('modes').setup()
    end
  },
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require('tsc').setup {
        auto_open_qflist = true,
        enable_progress_notifications = true,
        flags = {
          build = true,
        },
        hide_progress_notifications_from_history = true,
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,    -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            -- NormalFloat = { bg = "none" },
            -- FloatBorder = { bg = "none"},
            -- FloatTitle = { bg = "none"},
            -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- MasonNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            TelescopeTitle = { fg = theme.ui.special, bold = bold },
            TelescopePromptNormal = { bg = theme.ui.bg_m3 },
            TelescopePromptBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
            -- TelescopePromptBorder = { fg = 'none', bg = 'none' },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
        -- theme = "wave",              -- Load "wave" theme when 'background' option is not set
        -- background = {               -- map the value of 'background' option to a theme
        --   dark = "wave",           -- try "dragon" !
        --   light = "lotus"
        -- },
      })
    end
  },
  {
    'folke/tokyonight.nvim'
  },
  -- {
  --   'Exafunction/codeium.vim',
  --   config = function()
  --       -- Change '<C-g>' here to any keycode you like.
  --   vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
  --   vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --   vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --   vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  --   end
  -- },
  {
    'metakirby5/codi.vim'
  },
  {
    'petertriho/nvim-scrollbar',
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup({
        build_position_cb = function(plist, _, _, _)
          require("scrollbar.handlers.search").handler.show(plist.start_pos)
        end,
      })
      vim.cmd([[
        augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
        ]])
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      local cfg = {
        -- separator              = false, -- separator between line number and buffer text ("│" or extra " " padding)
        -- Builtin line number string options for ScLn() segment
        -- thousands              = false, -- or line number thousands separator string ("." / ",")
        -- relculright            = false, -- whether to right-align the cursor line number with 'relativenumber' set
        -- Custom line number string options for ScLn() segment
        -- lnumfunc               = nil, -- custom function called by ScLn(), should return a string
        -- reeval                 = false, -- whether or not the string returned by lnumfunc should be reevaluated
        -- Builtin 'statuscolumn' options
        setopt                 = true, -- whether to set the 'statuscolumn', providing builtin click actions
        -- ft_ignore = nil,       -- lua table with filetypes for which 'statuscolumn' will be unset
        -- order                  = "ScLa", -- order of the fold, sign, line number and separator segments
        -- Click actions
        -- Lnum                   = builtin.lnum_click,
        FoldPlus               = builtin.foldplus_click,
        FoldMinus              = builtin.foldminus_click,
        FoldEmpty              = builtin.foldempty_click,
        DapBreakpointRejected  = builtin.toggle_breakpoint,
        DapBreakpoint          = builtin.toggle_breakpoint,
        DapBreakpointCondition = builtin.toggle_breakpoint,
        DiagnosticSignError    = builtin.diagnostic_click,
        DiagnosticSignHint     = builtin.diagnostic_click,
        DiagnosticSignInfo     = builtin.diagnostic_click,
        DiagnosticSignWarn     = builtin.diagnostic_click,
        GitSignsTopdelete      = builtin.gitsigns_click,
        GitSignsUntracked      = builtin.gitsigns_click,
        GitSignsAdd            = builtin.gitsigns_click,
        GitSignsChangedelete   = builtin.gitsigns_click,
        GitSignsDelete         = builtin.gitsigns_click,
      }

      require("statuscol").setup(cfg)
    end
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    }
  },
  { "heavenshell/vim-jsdoc",       build = "make install" },
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  },
  -- {
  --   'gelguy/wilder.nvim',
  --   config = function()
  --     local wilder = require('wilder')
  --     wilder.setup({
  --       modes = { ':', '/', '?' },
  --       enable_cmd_enter = 1,
  --       next_key = '<Tab>',
  --       previous_key = '<S-Tab>',
  --       accept_key = '<C-n>', -- hisotry
  --       reject_key = '<C-p>', -- hisotry
  --     })

  --     wilder.set_option('renderer', wilder.popupmenu_renderer({
  --       -- highlighter applies highlighting to the candidates
  --       highlighter = wilder.basic_highlighter(),
  --     }))
  --   end
  -- },
  {
    "jessarcher/onedark.nvim",
    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
      })

      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
    end
  },
  {
    "ray-x/web-tools.nvim",
    config = function()
      require 'web-tools'.setup({
        keymaps = {
          rename = nil,        -- by default use same setup of lspconfig
          repeat_rename = '.', -- . to repeat
        },
      })
    end
  },
  {
    "andythigpen/nvim-coverage",
    config = function()
      require("coverage").setup()
    end
  },
  {
    "puremourning/vimspector",
    config = function()
      vim.cmd([[

      let g:vimspector_sign_priority = {
      \    'vimspectorBP':         998,
      \    'vimspectorBPCond':     997,
      \    'vimspectorBPDisabled': 996,
      \    'vimspectorPC':         999,
      \ }

      nnoremap <leader>dd :TestNearest -strategy=jest<CR>

      function! JestStrategy(cmd)
      let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
      call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
      endfunction
      let g:test#custom_strategies = {'jest': function('JestStrategy')}
      let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

      let g:vimspector_configurations = {
      \ "test_debugpy_config": {
      \   "adapter": "vscode-node",
      \   "configuration": {
      \   "name": "Jest Current File",
      \     "request": "launch",
      \     "type": "node",
      \     "cwd": "${workspaceFolder}",
      \      "args": [
      \          "${fileBasenameNoExtension}",
      \          "--config",
      \          "${workspaceFolder}/jest.config.js"
      \       ],
      \      "program": "${workspaceFolder}/node_modules/.bin/jest",
      \     "stopOnEntry": v:false,
      \     "console": "integratedTerminal"
      \   }
      \ } }
      ]])
    end
  },
  -- { 'ldelossa/nvim-ide', config = function()
  --   require('user.plugins.ide')
  -- end },
  { 'hkupty/iron.nvim' },
  {
    'michaelb/sniprun', build = 'bash ./install.sh',
  },
  -- themes
  {
    'rose-pine/neovim',
    lazy = false,
    name = 'rose-pine',
    config = function()
      -- vim.cmd('colorscheme rose-pine')
      vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      })

      -- Make the cursor line background invisible
      vim.api.nvim_set_hl(0, 'CursorLineBg', {
        fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      })

      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
      })
    end
  },
  -- Mark
  { 'kshenoy/vim-signature' },
  {
    'terryma/vim-expand-region',
    config = function()
      -- Press + to expand the visual selection and _ to shrink it.
    end
  },
  -- {
  --   "airblade/vim-rooter"
  -- },
  {
    "terryma/vim-multiple-cursors"
  },
  -- Command
  {
    "FeiyouG/command_center.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("command_center")
      local command_center = require("command_center")
      command_center.add({
        {
          desc = "编译商家小程序npm",
          cmd =
          "<CMD>:!cd /Users/weston/Projects/WOSAI/FRONTEND/merchant-mp-default && cli --project `pwd` build-npm<CR>",
        }
      })
    end
  },
  -- KEYMAPS
  -- LSP
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
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
    -- dependencies = "kyazdani42/nvim-web-devicons",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  -- GIT
  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
    config = function()
    end
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
  -- {
  --   "echasnovski/mini.map",
  --   branch = "stable",
  --   config = function()
  --     require('mini.map').setup()
  --     local map = require('mini.map')
  --     map.setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.diagnostic({
  --           error = 'DiagnosticFloatingError',
  --           warn  = 'DiagnosticFloatingWarn',
  --           info  = 'DiagnosticFloatingInfo',
  --           hint  = 'DiagnosticFloatingHint',
  --         }),
  --       },
  --       symbols = {
  --         encode = map.gen_encode_symbols.dot('4x2'),
  --       },
  --       window = {
  --         side = 'right',
  --         width = 20, -- set to 1 for a pure scrollbar :)
  --         winblend = 15,
  --         show_integration_count = false,
  --       },
  --     })
  --   end
  -- },
  -- TEXT
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { 'prettier/vim-prettier' },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,                        -- enable this plugin (the default)
        enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,               -- show stop reason when stopped for exceptions
        commented = false,                     -- prefix virtual text with comment string
        only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
        all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
        filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
        -- experimental features:
        virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end
  },
  -- TEST
  {
    'vim-test/vim-test',
    config = function()
      vim.cmd([[
  function! FloatermStrategy(cmd)
  execute 'silent FloatermKill'
  execute 'FloatermNew! '.a:cmd.' '
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
      -- vim.cmd([[
      --   let test#strategy = "neovim"
      --   let g:test#preserve_screen = 1
      -- ]])
    end,
  },
  {
    'David-Kunz/jester',
    config = function()
      require("jester").setup({
        identifiers = { "test", "it" },
        terminal_cmd = ':vsplit | terminal',
        path_to_jest_debug = 'node_modules/.bin/jest',
        path_to_jest_run = 'node_modules/.bin/jest',
        stringCharaters = { "'", '"' },
        expressions = { "call_expression" },
        prepend = { "describe" },
        regexStartEnd = true,
        escapeRegex = true,
        dap = {
          type = 'node2',
          request = 'launch',
          args = { "--no-cache" },
          -- cwd = '/Users/weston/Projects/WOSAI/FRONTEND/emenu-mini-core',
          sourceMaps = "inline",
          protocol = 'inspector',
          skipFiles = { '<node_internals>/**/*.js' },
          console = 'integratedTerminal',
          port = 9229,
          disableOptimisticBPs = true
        },
        cache = {
          -- used to store the information about the last run
          last_run = nil,
          last_used_term_buf = nil
        }
      })
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest',
    },
    config = function()
      require("neotest").setup({
        library = { plugins = { "neotest" }, types = true },
        adapters = {
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),

        },
      })
    end
  },
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
      ]])
    end
  },
  -- WX
  { 'chemzqm/wxapp.vim' },
  -- {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require 'colorizer'.setup {
  --       'less',
  --       'css',
  --       'javascript',
  --       html = {
  --         mode = 'foreground',
  --       }
  --     }
  --   end
  -- },
  -- TEXT Align
  { 'junegunn/vim-easy-align' },
  -- NPM
  { 'elianiva/telescope-npm.nvim' },
  -- 错误开关
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
      --       require('toggle-lsp-diagnostics').init()
      require('toggle_lsp_diagnostics').init { underline = false, virtual_text = { prefix = 'SMART', spacing = 5 } }
    end
  },
  -- Window Zoom
  --  use <C-w>m
  { 'dhruvasagar/vim-zoom' },
  { 'christoomey/vim-tmux-navigator' },
  {
    "folke/zen-mode.nvim",
    lazy = false,
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
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
  },
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "p00f/nvim-ts-rainbow",
  "mfussenegger/nvim-jdtls",
  -- "karb94/neoscroll.nvim",
  "opalmay/vim-smoothie",
  -- "j-hui/fidget.nvim",
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/templeos.nvim",
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "hrsh7th/cmp-emoji",
  "ggandor/leap.nvim",
  "nacro90/numb.nvim",
  "TimUntersberger/neogit",
  -- "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  -- "petertriho/nvim-scrollbar",
  "renerocksai/telekasten.nvim",
  "renerocksai/calendar-vim",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  -- {
  --   "0x100101/lab.nvim",
  --   build = "cd js && npm ci",
  -- },
  { "tzachar/cmp-tabnine",               build = "./install.sh" },
  { "github/copilot.vim",                lazy = false },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    -- "zbirenbaum/copilot.lua",
    -- -- event = { "VimEnter" },
    -- config = function()
    --   vim.defer_fn(function()
    --     require("copilot").setup {
    --       plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
    --     }
    --   end, 100)
    -- end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup {
  --       formatters = {
  --         insert_text = require("copilot_cmp.format").remove_existing,
  --       },
  --     }
  --   end,
  -- },
  -- "MunifTanjim/nui.nvim",
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },
}
