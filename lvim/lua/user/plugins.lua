-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "jessarcher/onedark.nvim", config = function()

    vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })

    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
  end },
  { "ray-x/web-tools.nvim",
    config = function()
      require 'web-tools'.setup({
        keymaps = {
          rename = nil, -- by default use same setup of lspconfig
          repeat_rename = '.', -- . to repeat
        },
      })
    end
  },
  { "andythigpen/nvim-coverage",
    config = function()
      require("coverage").setup()
    end },
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
    'michaelb/sniprun', run = 'bash ./install.sh',
  },
  -- themes
  {
    'rose-pine/neovim',
    as = 'rose-pine',
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

      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#22232b' })
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
  "glepnir/lspsaga.nvim",
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
      vim.cmd([[
  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill'
    execute 'FloatermNew! '.a:cmd.' '
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]]     )
      -- vim.cmd([[
      --   let test#strategy = "neovim"
      --   let g:test#preserve_screen = 1
      -- ]])
    end,
  },
  { 'David-Kunz/jester', config = function()
    require("jester").setup({
      identifiers = { "test", "it" },
      terminal_cmd = ':vsplit | terminal',
      path_to_jest_debug = 'node_modules/.bin/jest',
      path_to_jest_run = 'node_modules/.bin/jest',
      stringCharacters = { "'", '"' },
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
      cache = { -- used to store the information about the last run
        last_run = nil,
        last_used_term_buf = nil
      }
    })
  end },
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

    end
  },
  "ellisonleao/gruvbox.nvim",
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
  "folke/todo-comments.nvim",
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
  "petertriho/nvim-scrollbar",
  "renerocksai/telekasten.nvim",
  "renerocksai/calendar-vim",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
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
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },
  { "tzachar/cmp-tabnine", run = "./install.sh" },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },
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

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
}
