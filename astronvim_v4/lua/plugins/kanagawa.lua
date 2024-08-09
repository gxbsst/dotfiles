return {
    'rebelot/kanagawa.nvim',
    lazy = true,
    config = function()
        require('kanagawa').setup({
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            -- typeStyle = {},
            -- transparent = true,    -- do not set background color
            -- dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
            -- colors = {
            -- add/modify theme and palette colors
            -- palette = {},
            -- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            -- },
            -- overrides = function(colors) -- add/modify highlights
            --     local theme = colors.theme
            --     return {
            --         -- NormalFloat = { bg = "none" },
            --         -- FloatBorder = { bg = "none"},
            --         -- FloatTitle = { bg = "none"},
            --         -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            --         -- LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            --         -- MasonNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            --         TelescopeTitle = { fg = theme.ui.special, bold = bold },
            --         TelescopePromptNormal = { bg = theme.ui.bg_m3 },
            --         TelescopePromptBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
            --         -- TelescopePromptBorder = { fg = 'none', bg = 'none' },
            --         TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            --         TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            --         TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            --         TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            --     }
            -- end,
            -- theme = "wave",              -- Load "wave" theme when 'background' option is not set
            -- background = {               -- map the value of 'background' option to a theme
            --   dark = "wave",           -- try "dragon" !
            --   light = "lotus"
            -- },
        })
        -- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#000000' })
        -- vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        --     fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        --     bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        -- })

        -- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#000000' })
    end
}
