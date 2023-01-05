require("colorizer").setup({
  'less',
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  },
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = false, -- "Name" codes like Blue or blue
    RRGGBBAA = false, -- #RRGGBBAA hex codes
    AARRGGBB = false, -- 0xAARRGGBB hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = false, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = false, parsers = { css } }, -- Enable sass colors
    virtualtext = "■",
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "*.css",
  },
  callback = function()
    require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
  end,
})