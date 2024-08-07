-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true,                                 -- enable autopairs at start
            cmp = true,                                       -- enable completion at start
            diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true,                              -- highlight URLs at start
            notifications = true,                             -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = {                    -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true,         -- sets vim.opt.number
                spell = false,         -- sets vim.opt.spell
                signcolumn = "yes",    -- sets vim.opt.signcolumn to yes
                wrap = false,          -- sets vim.opt.wrap
            },
            g = {                      -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
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
            i = {
                [';;'] = { '<Esc>A;' },
                [',,'] = { '<Esc>A,' }
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
