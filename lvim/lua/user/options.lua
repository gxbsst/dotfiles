-- local kind_icons = {
--   Text = "",
--   Method = "m",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
-- lvim.builtin.cmp.formatting = {
--   formatting = {
--     -- fields = { "kind", "abbr", "menu" },
--     format = function(entry, vim_item)
--       -- Kind icons
--       -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--       vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--       vim_item.menu = ({
--         nvim_lsp = "[LSP]",
--         luasnip = "[Snippet]",
--         buffer = "[Buffer]",
--         path = "[Path]",
--       })[entry.source.name]
--       return vim_item
--     end,
--   },
-- }


vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.relativenumber = true

-- fold 代码折叠
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"
vim.g.noautochdir = true
-- general
lvim.colorscheme = 'rose-pine'
-- lvim.colorscheme = 'gruvbox'
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
lvim.builtin.indentlines.active = true
lvim.builtin.indentlines.options.space_char_blankline = " "
lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.show_current_context_start = false
-- lualine
-- lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.sections.lualine_c = { "diff" }
-- lvim.use_icons = false
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["S"] = ":w<cr>"

lvim.builtin.gitsigns.opts.sign_priority = 100

-- lvim.builtin.nvimnavic.active = true
vim.g.navic_silence = true
local navic = require("nvim-navic")
navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = true,
  separator = " - ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}
lvim.lsp.on_attach_callback = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local function getnavic()
  if navic.is_available() then
    return navic.get_location()
  else
    return
  end
end

lvim.builtin.lualine.sections.lualine_c = { { getnavic } }


-- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.update_focused_file = {
  update_cwd = false, update_focused_file = false, enable = false,
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

-- LunarVim
-- lvim.log.level = "warn"
-- lvim.builtin.alpha.active = true
-- lvim.lsp.diagnostics.float.focusable = true
-- lvim.reload_config_on_save = false
-- lvim.builtin.illuminate.active = false
-- lvim.builtin.bufferline.active = false
-- lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.breadcrumbs.active = true
-- lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.dap.active = true
-- lvim.keys.term_mode = { ["<C-l>"] = false }
-- lvim.builtin.cmp.cmdline.enable = false
-- lvim.builtin.cmp.window.documentation = false
-- lvim.builtin.cmp.window.completion = {
--   border = "rounded",
--   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
-- }
-- lvim.builtin.cmp.formatting.source_names = {
--   nvim_lsp = "",
--   emoji = "",
--   path = "",
--   calc = "",
--   cmp_tabnine = "",
--   vsnip = "",
--   luasnip = "",
--   buffer = "",
--   tmux = "",
--   copilot = "",
--   treesitter = "",
-- }
-- lvim.builtin.autopairs.active = true
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
vim.opt.showtabline = 0

local options = {
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
  showtabline = 0, -- always show tabs
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
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  -- relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 0,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
-- vim.opt.fillchars = vim.opt.fillchars + "eob: "
-- vim.opt.fillchars:append {
--   stl = " ",
-- }

-- vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}

-- telescope
-- lvim.builtin.telescope.theme = "ivy"
-- lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults = {
  theme = 'ivy',
  layout_strategy = 'horizontal',
  layout_config = {
    horizontal = { width = 0.7 }
  }
}
-- lvim.builtin.telescope.extensions.live_grep_args = {
--   theme = 'ivy',
--   layout_strategy = 'horizontal',
--   layout_config = {
--     mirror = true
--   }
-- }

-- NvimTree
-- 默认打开 NvimTreeOpen
vim.schedule(function()
  -- vim.cmd "noautocmd NvimTreeOpen"
end)

-- local bufnr = vim.cmd('vs');
-- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "hello", "world" })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("TjsCoolTuturial", { clear = true }),
--   callback = function()
--     vim.fn.jobstart({ "cli", "build-npm" }, { stdout_buffered = true, on_stdout = function(_, data)
--       vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
--     end })
--   end
-- })
-- 设置fold
vim.opt.background = "dark"

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end
