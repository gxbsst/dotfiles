vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- fold 代码折叠
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"
vim.g.noautochdir = true
-- general
lvim.colorscheme = 'rose-pine'
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- lualine
-- lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.sections.lualine_c = { "diff" }
-- lvim.use_icons = false
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["S"] = ":w<cr>"

-- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.update_focused_file = { update_cwd = false, update_focused_file = false, enable = false,
  update_root = false,
  ignore_list = { "package.json", }
}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.project.detection_methods = nil
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.nvimtree.setup.update_cwd = false

-- -- DAP CONFIG
lvim.builtin.dap.active = true


-- NvimTree
-- 默认打开 NvimTreeOpen
vim.schedule(function()
  vim.cmd "noautocmd NvimTreeOpen"
end)
