-- local wezterm = require 'wezterm'
-- return {
--   -- font = wezterm.font 'JetBrains Mono',
--   -- color_scheme = 'Batman',
--    font = wezterm.font 'Fira Code',
--   -- You can specify some parameters to influence the font selection;
--   -- for example, this selects a Bold, Italic font variant.
--   font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),
--   harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

-- }

local wezterm = require 'wezterm'

return {
  font_size = 13,
  line_height = 1.2,
  leader = { key="A", mods="CTRL" },

  keys = {
    {
      key = 'f',
      mods = 'LEADER',
      action = wezterm.action.ToggleFullScreen,
    },
    -- This will create a new split and run the `top` program inside it
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal {
        args = { },
      },
    },
    { key = "-", mods = "LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },

  },
  --  color_scheme = 'Galaxy',
  --  color_scheme = "Gruvbox (Gogh)",
  --    color_scheme = "Gruvbox dark, medium (base16)",
  hide_tab_bar_if_only_one_tab = true,
  tab_and_split_indices_are_zero_based = true,
  enable_tab_bar = false,
  -- window_decorations = "NONE",

  font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),

  -- font = wezterm.font_with_fallback {
  --   {
  --     family = 'JetBrains Mono',
  --     weight = 'Medium',
  --     harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  --     line_height = 2,
  --   },
  --   { family = 'Terminus', weight = 'Bold', line_height = 1.3 }, 

  --   'Noto Color Emoji',
  -- },
}
