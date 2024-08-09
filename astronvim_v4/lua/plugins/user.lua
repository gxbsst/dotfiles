-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

-- -@type LazySpec
return {

    -- == Examples of Adding Plugins ==

    "andweeb/presence.nvim",
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("lsp_signature").setup()
    --     end,
    -- },

    -- You can disable default plugins as follows:
    { "max397574/better-escape.nvim", enabled = false },

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                    -- don't add a pair if the next character is %
                        :with_pair(cond.not_after_regex "%%")
                    -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                    -- don't move right when repeat character
                        :with_move(cond.none())
                    -- don't delete if the next character is xx
                        :with_del(cond.not_after_regex "xx")
                    -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                    -- don't add a pair if the next character is %
                        :with_pair(cond.not_after_regex "%%")
                    -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                    -- don't move right when repeat character
                        :with_move(cond.none())
                    -- don't delete if the next character is xx
                        :with_del(cond.not_after_regex "xx")
                    -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },
    { "github/copilot.vim",           evnet = "InsertEnter", lazy = false },
    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
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
    {
        "akinsho/bufferline.nvim",
        event = "UIEnter",
        config = function()
            require('bufferline').setup {}
        end
    },
    {
        'simrat39/symbols-outline.nvim',
        event = "LspAttach",
        config = function()
            require("symbols-outline").setup({
                -- auto_preview = false,
                autofold_depth = 1,
                -- auto_close = true,
            })
        end
    },
    { 'chemzqm/wxapp.vim',       lazy = false },
    -- TEXT Align

    { 'junegunn/vim-easy-align', event = 'BufRead' },
    -- 错误开关
    {
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        event = 'LspAttach',
        config = function()
            --       require('toggle-lsp-diagnostics').init()
            require('toggle_lsp_diagnostics').init { underline = false, virtual_text = { prefix = 'SMART', spacing = 5 } }
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
}
