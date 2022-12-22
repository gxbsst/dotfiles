require('rose-pine').setup({
    disable_background = true
})

function ColorMyPencils(color) 
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- Packer can manage itself.
use('wbthomason/packer.nvim')
 -- Packer can manage itself
  -- use 'wbthomason/packer.nvim'

-- Add a dashboard.
use({
  'glepnir/dashboard-nvim',
  config = function()
    require('weston/plugins/dashboard-nvim')
  end
})
-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('weston/plugins/telescope')
  end,
})

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
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
  })

  -- use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use('nvim-treesitter/playground')

  -- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground'
  },
  config = function()
    require('weston/plugins/treesitter')
  end,
})

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
 

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

    },
    config = function ( )
      require('weston/plugins/lsp')
    end
  }

 -- format
  use({
  'prettier/vim-prettier',
  config = function()
   
  end
})

  use({"folke/zen-mode.nvim",
  config = function() 
    require("zen-mode").setup {
    window = {
        width = 90,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

   vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    -- ColorMyPencils()
    end)
  end 
})
  use("github/copilot.vim")

  -- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('weston/plugins/nvim-tree')
  end,
})

-- find and replace
use({'nvim-pack/nvim-spectre'})

-- Display buffers as tabs.
use({
  'akinsho/bufferline.nvim',
   tag = "v3.*",
  -- requires = 'kyazdani42/nvim-web-devicons',
  -- after = 'onedark.nvim',
  config = function()
    require('weston/plugins/bufferline')
  end,
})

-- A Status line.
use({
  'nvim-lualine/lualine.nvim',
  -- requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('weston/plugins/lualine')
  end,
})

-- Git integration.

 use({'tpope/vim-fugitive', 
    requires = 'tpope/vim-rhubarb',
    config = function() 
      require('weston/plugins/fugitive')
    end
  })

use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    -- vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns reset_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

-- Commenting support.
use('tpope/vim-commentary')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

--- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
    vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]])
  end
})
-- WX
use('chemzqm/wxapp.vim')

-- use 'bluz71/vim-nightfly-colors'
-- One Dark theme.
use({
  'jessarcher/onedark.nvim',
  config = function()
    -- vim.cmd('colorscheme onedark')

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
  end,
})

-- 显示颜色
use({'norcalli/nvim-colorizer.lua', 
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
})

-- TEXT Align
use({'junegunn/vim-easy-align'})
-- Mark
use({'kshenoy/vim-signature'})
use('elianiva/telescope-npm.nvim')
-- 错误开关
use({'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', 
config = function() 
    require'toggle_lsp_diagnostics'.init()
end})
