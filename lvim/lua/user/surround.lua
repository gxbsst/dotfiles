local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    insert = ",gs",
    insert_line = "<,-g>S",
    normal = "s",
    normal_cur = "ss",
    normal_line = "S",
    normal_cur_line = "SS",
    visual = "s",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
}

vim.cmd [[nmap <leader>' siw']]
