-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--     ]]
--   end,
-- })

-- gitsign
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "" },
  callback = function()
    -- git 颜色
    -- vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#00ff00' })
    -- vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#ff0000' })
    -- vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#ffcc00' })
    -- vim.cmd('highlight GitSignsDelete guibg=#ff0000')
    -- vim.cmd('highlight GitSignsAdd guibg=#00ff00')
    -- vim.cmd('highlight GitSignsChange guibg=#ffcc00')

    -- fold
    vim.cmd('hi FoldColumn guibg=none')
    vim.cmd('hi SignColumn guibg=none')
    --vim.cmd('set fillchars+=vert:\\') -- 设置panel线条为无
    vim.cmd('hi! VertSplit guifg=#333333 guibg=none ctermfg=none ctermbg=none')

    -- local color = vim.cmd('echo synIDattr(hlID("Normal"), "bg")')
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = 'none' })
    vim.cmd('hi! IndentBlanklineChar guifg=#000000 guibg=none ctermfg=none ctermbg=none')

    -- 设置背景为无
    vim.cmd('hi Normal ctermbg=none guibg=none')
    -- 数字背景LineNr
    vim.cmd('hi LineNr ctermbg=none guibg=none')
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
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "Jaq" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> <m-r> :close<CR>
      " nnoremap <silent> <buffer> <m-r> <NOP>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <c-j> j<CR>
      " nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]]
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "" },
--   callback = function()
--     local get_project_dir = function()
--       local cwd = vim.fn.getcwd()
--       local project_dir = vim.split(cwd, "/")
--       local project_name = project_dir[#project_dir]
--       return project_name
--     end

--     vim.opt.titlestring = get_project_dir() .. " - nvim"
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    -- TODO: if java = 2
    vim.cmd "set cmdheight=1"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.opt_local.wrap = true
    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "NeogitCommitMessage" },
  callback = function()
    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.opt_local.wrap = true
    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.opt_local.spell = true
    vim.cmd "startinsert!"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.java" },
--   callback = function()
--     vim.lsp.codelens.refresh()
--   end,
-- })

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})



vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "" },
  callback = function()
    local color = {
      fg = "#838994",
      bg = "#252829",
    }

    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = color.fg, bg = color.bg, gui = "bold" },
            b = { fg = color.fg, bg = color.bg, gui = "bold" },
            c = { fg = color.fg, bg = color.bg, gui = "bold" },
            insert = {
              a = { fg = color.fg, bg = color.bg, gui = "bold" },
              b = { fg = color.fg, bg = color.bg, gui = "bold" },
            },
            visual = {
              a = { fg = color.fg, bg = color.bg, gui = "bold" },
              b = { fg = color.fg, bg = color.bg, gui = "bold" },
            },
            command = {
              a = { fg = color.fg, bg = color.bg, gui = "bold" },
              b = { fg = color.fg, bg = color.bg, gui = "bold" },
            },
            replace = {
              a = { fg = color.fg, bg = color.bg, gui = "bold" },
              b = { fg = color.fg, bg = color.bg, gui = "bold" },
            },
            inative = {
              a = { fg = color.fg, bg = color.bg, gui = "bold" },
              b = { fg = color.fg, bg = color.bg, gui = "bold" },
              c = { fg = color.fg, bg = color.bg, gui = "bold" },
            },
          }
        }
      }
    })
  end,
})



-- vim.api.nvim_create_autocmd({ "ModeChanged" }, {
--   callback = function()
--     local luasnip = require "luasnip"
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.ts" },
--   callback = function()
--     vim.lsp.buf.format { async = true }
--   end,
-- })
