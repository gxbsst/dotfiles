return function()
  -- 设置折叠代码背景颜色
  vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.*" }, command = "highlight Folded guibg=none ctermfg=none" }
  )
 -- 格式化HTML
  vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = { "*.wxml" }, command = "Neoformat" }
  )

  -- 自动格式化wxml使用neoformat
  vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = { "*.wxml" }, command = "Neoformat" }
  )

  -- vim.api.nvim_create_autocmd(
  --   { "BufRead", "BufNewFile" },
  --   { pattern = { "*.*" }, command = "colorscheme onedark" }
  -- )

  if vim.fn.exists "$TMUX" == 1 then
    local has_tmux, _ = pcall(require, "tmux")
    if has_tmux then
      require("tmux").setup {
        copy_sync = {
          enable = false,
        },
        navigation = {
          cycle_navigation = true,
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      }
    end
  end

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
    filename = {
      ["CmakeLists.txt"] = "cmake",
      [".clang-format"] = "yaml",
    },
  }

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
      vim.cmd('hi! VertSplit guifg=#222222 guibg=none ctermfg=none ctermbg=none')

      -- local color = vim.cmd('echo synIDattr(hlID("Normal"), "bg")')
      -- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = 'none' })
      vim.cmd('hi! IndentBlanklineChar guifg=#111111 guibg=none ctermfg=none ctermbg=none')

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


  vim.cmd "set whichwrap+=<,>,[,],h,l"
  vim.cmd [[set iskeyword+=-]]
  vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

  vim.filetype.add {
    extension = {
      conf = "dosini",
    },
  }



  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""

  require("notify").setup({ background_colour = "#000000" })

  vim.cmd "au BufRead,BufNewFile *.wxml set filetype=wxml"


end
