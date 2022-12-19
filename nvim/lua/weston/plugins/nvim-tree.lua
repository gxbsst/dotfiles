require('nvim-tree').setup({
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    ignore = false,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
        -- { key = "U", action = "dir_down" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
    indent_markers = {
      enable = false,
    },
  },
})

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')

-- 默认打开 NvimTreeOpen
vim.schedule(function()
  vim.cmd "noautocmd NvimTreeOpen"
end)