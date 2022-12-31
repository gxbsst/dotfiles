-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { 'hkupty/iron.nvim', config = function()
    local iron = require("iron.core")
    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" }
          }
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require('iron.view').bottom(40),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
    vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
  end },
  {
    'michaelb/sniprun', run = 'bash ./install.sh',
    config = function()
      require 'sniprun'.setup({

        repl_disable = {}, --# disable REPL-like behavior for the given interpreters
        selected_interpreters = { "JS_TS_deno" },
        repl_enable = { "JS_TS_deno" },
        interpreter_options = { --# interpreter-specific options, see docs / :SnipInfo <name>

          --# use the interpreter name as key
          -- GFM_original = {
          --   use_on_filetypes = { "markdown.pandoc" } --# the 'use_on_filetypes' configuration key is
          --   --# available for every interpreter
          -- },
          Python3_original = {
            error_truncate = "auto" --# Truncate runtime errors 'long', 'short' or 'auto'
            --# the hint is available for every interpreter
            --# but may not be always respected
          }
        },

        --# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
        --# to filter only sucessful runs (or errored-out runs respectively)
        display = {
          "Classic", --# display results in the command-line  area
          "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

          -- "VirtualText",             --# display results as virtual text
          -- "TempFloatingWindow",      --# display results in a floating window
          -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
          -- "Terminal",                --# display results in a vertical split
          -- "TerminalWithCode",        --# display results and code history in a vertical split
          -- "NvimNotify",              --# display with the nvim-notify plugin
          -- "Api"                      --# return output to a programming interface
        },

        live_display = { "VirtualTextOk" }, --# display mode used in live_mode

        display_options = {
          terminal_width = 45, --# change the terminal display option width
          notification_timeout = 5 --# timeout for nvim_notify output
        },

        --# You can use the same keys to customize whether a sniprun producing
        --# no output should display nothing or '(no output)'
        show_no_output = {
          "Classic",
          "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
        },

        --# customize highlight groups (setting this overrides colorscheme)
        snipruncolors = {
          SniprunVirtualTextOk  = { bg = "#66eeff", fg = "#000000", ctermbg = "Cyan", cterfg = "Black" },
          SniprunFloatingWinOk  = { fg = "#66eeff", ctermfg = "Cyan" },
          SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
          SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
        },

        live_mode_toggle = 'off', --# live mode toggle, see Usage - Running for more info

        --# miscellaneous compatibility/adjustement settings
        inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages
        --# to workaround sniprun not being able to display anything

        borders = 'single', --# display borders around floating windows
        --# possible values are 'none', 'single', 'double', or 'shadow'
      })
    end
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

      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
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
  "lunarvim/darkplus.nvim",
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
  {
    "zbirenbaum/copilot.lua",
    -- event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
    end,
  },
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
