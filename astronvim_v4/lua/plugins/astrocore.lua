-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		_G.THEME = require("user.util.theme").setup()
		vim.cmd('highlight Folded guifg=none guibg=none ctermfg=none ctermbg=none')

		vim.cmd [[highlight IndentBlanklineIndent1 guifg=#111111 gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent2 guifg=#111111 gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent3 guifg=#111111 gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent6 guifg=#111111 gui=nocombine]]
	end
})
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
		    shiftwidth = 2,
		    tabstop = 2,
		    -- fold 代码折叠
		    foldlevel = 20,
		    list = true,
		    -- 是否显示tabs
		    showtabline = 2,

		    backup = false, -- creates a backup file
		    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		    cmdheight = 1, -- more space in the neovim command line for displaying messages
		    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
		    conceallevel = 0, -- so that `` is visible in markdown files
		    fileencoding = "utf-8", -- the encoding written to a file
		    hlsearch = true, -- highlight all matches on previous search pattern
		    ignorecase = true, -- ignore case in search patterns
		    mouse = "a", -- allow the mouse to be used in neovim
		    pumheight = 10, -- pop up menu height
		    showmode = false, -- we don't need to see things like -- INSERT -- anymore
		    smartcase = true, -- smart case
		    smartindent = true, -- make indenting smarter again
		    splitbelow = true, -- force all horizontal splits to go below current window
		    splitright = true, -- force all vertical splits to go to the right of current window
		    swapfile = false, -- creates a swapfile
		    termguicolors = true, -- set term gui colors (most terminals support this)
		    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
		    undofile = true, -- enable persistent undo
		    updatetime = 100, -- faster completion (4000ms default)
		    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
		    expandtab = true, -- convert tabs to spaces
		    cursorline = true, -- highlight the current line
		    number = true, -- set numbered lines
		    laststatus = 3,
		    showcmd = false,
		    ruler = false,
		    relativenumber = true, -- set relative numbered lines
		    numberwidth = 4, -- set number column width to 2 {default 4}
		    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
		    wrap = false, -- display lines as one long line
		    scrolloff = 0,
		    sidescrolloff = 8,
		    guifont = "JetBrainsMono_Nerd_Font:h15", -- the font used in graphical neovim applications
		    title = true,
		    shell = "/bin/zsh -i",

      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        --
		    noautochdir = true,
		    neoformat_enabled_html = { "prettier" },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      -- n = {
      --   -- second key is the lefthand side of the map
      --
      --   -- navigate buffer tabs
      --   ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
      --   ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
      --
      --   -- mappings seen under group name "Buffer"
      --   ["<Leader>bd"] = {
      --     function()
      --       require("astroui.status.heirline").buffer_picker(
      --         function(bufnr) require("astrocore.buffer").close(bufnr) end
      --       )
      --     end,
      --     desc = "Close buffer from tabline",
      --   },
      --
      --   -- tables with just a `desc` key will be registered with which-key if it's installed
      --   -- this is useful for naming menus
      --   -- ["<Leader>b"] = { desc = "Buffers" },
      --
      --   -- setting a mapping to false will disable it
      --   -- ["<C-S>"] = false,
      -- },
      i = {
        [';;'] = { '<Esc>A;' },
        [',,'] = { '<Esc>A,' }
      },
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ['<leader>r'] = { ':Telescope resume<cr>' },
        ['<S-l>'] = { ":BufferLineCycleNext<CR>" },
        ['<S-h>'] = { ":BufferLineCyclePrev<CR>" },
        -- ['<F1>'] = { ":FloatermToggle<CR>" },
        ['<F2>'] = {
          function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end
        },
        ['F3'] = {
          function()
            vim.lsp.buf.code_action()
          end
        },
        ['<F7>'] = { ':SymbolsOutline<cr>' },
        ['<F8>'] = { ':SymbolsOutline<cr>' },
        ['F11'] = {
          function()
            vim.diagnostic.goto_prev()
          end
        },
        ['<leader>H'] = { ':nohlsearch<cr>' },
        ['q'] = { ':q<cr>', desc = "" },
        ['<C-o>'] = { "<cmd>Telescope git_files<cr>" },
        -- ['<C-F>'] = {
        --   '<cmd>lua require(\'telescope.builtin\').find_files({ no_ignore = true, prompt_title = \'All Files\' })<cr>'
        -- },
        ['<C-e>'] = { '<cmd>lua require(\'telescope.builtin\').buffers()<cr>' },
        ['<C-g>'] = { ':Telescope live_grep<cr>' },
        ['<C-s>'] = { '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>' },
        ['<C-r>'] = { ':Telescope npm scripts<cr>' },
        [',,'] = { '<cmd>Lspsaga lsp_finder<cr>' },
        [',r'] = { '<cmd>Lspsaga rename<cr>' },
        [',p'] = { '<cmd>Lspsaga peek_definition<cr>' },
        [',e'] = { '<cmd>Lspsaga show_line_diagnostics<cr>' },
        [',E'] = { '<cmd>Lspsaga show_cursor_diagnostics<cr>' },
        ['[e'] = { '<cmd>Lspsaga diagnostic_jump_prev<cr>' },
        [']e'] = { '<cmd>Lspsaga diagnostic_jump_next<cr>' },
        ['[E'] = { function()
          require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end },
        [']E'] = { function()
          require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        end },
        [',o'] = { '<cmd>Lspsaga outline<cr>' },
        ['<C-i>'] = { '<cmd>Lspsaga hover_doc<cr>' },
        ['<leader>p'] = { '<cmd>Telescope<cr>' },
        -- ['<leader>r'] = { '<cmd>Telescope<cr>' },
        ['zz'] = { ':ZenMode<cr>' },
        ['<leader>r'] = { "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
        ['<leader>R'] = { "<cmd>lua require('spectre').open()<cr>", desc = "replace" },
        ['<leader>gj'] = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "next_hunk" },
        ['<leader>gk'] = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "prev_hunk" },
        ['<leader>gr'] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
        ['<leader>gR'] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
      },
      v = {
        ['F3'] = {
          function()
            vim.lsp.buf.code_action()
          end
        },
        ['<C-g>'] = 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>'
      }


    },
  },
}
