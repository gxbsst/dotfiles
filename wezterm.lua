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
local dimmer = { brightness = 0.008, hue = 0.1, saturation = 1.0 }
local launch_menu = {
  {
    args = { "btop" },
  },
  {
    label = "Scratchpad",
    -- args = { "nvim", "" }，
    set_environment_variables = { KITTY_COLORS = "dark" },
  },
}

local colors = {
  tab_bar = {
    inactive_tab_edge = '#000000',
    background = '#0b0022',
    active_tab = {
      bg_color = '#15493D',
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },
    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },
    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

local background = {
  {
    source = {
      File = '/Users/weston/dotfiles/RED_LOGO.png',
    },
    -- width = '100%',
    -- height = '100%',

    opacity = 1.0,
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    vertical_align = 'Middle',
    horizontal_align = "Center",
    hsb = dimmer,
    -- attachment = { Parallax = 0.3 },
  }
}

local window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  active_titlebar_bg = '#000000',
  inactive_titlebar_bg = '#000000',
}

local keys = {
  {
    key = 'm',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'f',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ToggleFullScreen,
  },
  -- This will create a new split and run the `top` program inside it
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal {
      args = {},
    },
  },
  { key = "d", mods = "CMD|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
}

local font = wezterm.font_with_fallback {
  {
    -- family = 'JetBrains Mono',
    -- family = 'Menlo',
    -- family = 'Fira Mono for Powerline',
    -- family = 'FiraCode Nerd Font Mono',
    -- family = 'Hack Nerd Font Mono',
    -- family = 'Fira Code',
    family            = 'Monaco',
    weight            = 'Bold',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    italic            = false
  },
  { family = 'Terminus', weight = 'Bold' },
  -- { family = 'JetBrains Mono', weight = 'Bold', italic = false },

  'Noto Color Emoji',
}

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     if tab.is_active then
--       return {
--         { Background = { Color = '#15493D' } },
--         { Text = ' ' .. tab.active_pane.title .. ' ' },
--       }
--     end
--     return tab.active_pane.title
--   end
-- )

-- -- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- -- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     local edge_background = '#0b0022'
--     local background = '#1b1032'
--     local foreground = '#808080'

--     if tab.is_active then
--       background = '#15493D'
--       foreground = '#c0c0c0'
--     elseif hover then
--       background = '#3b3052'
--       foreground = '#909090'
--     end

--     local edge_foreground = background

--     -- ensure that the titles fit in the available space,
--     -- and that we have room for the edges.
--     local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

--     return {
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       -- { Text = SOLID_LEFT_ARROW },
--       { Background = { Color = background } },
--       { Foreground = { Color = foreground } },
--       { Text = title },
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       { Text = SOLID_RIGHT_ARROW },
--     }
--   end
-- )

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--      local title = wezterm.truncate_left(tab.active_pane.title, 50)
--     if tab.is_active then
--       return {
--         { Text = ' ' .. title .. ' ' },
--       }
--     end
--     return title
--   end
-- )


return {
  --  color_scheme = "Gruvbox (Gogh)",
  -- color_scheme = "Gruvbox dark, medium (base16)",
  -- color_scheme = 'carbonfox',
  color_scheme = 'Galaxy',
  -- color_scheme = 'Batman',
  --   color_scheme = "tokyonight",
  --  color_scheme = "TokyoNight (Gogh)",
  --    color_scheme = "tokyonight-day",
  --     color_scheme = "tokyonight-storm",
  --     color_scheme = "TokyoNightLight (Gogh)",
  -- color_scheme = "TokyoNightStorm (Gogh)",
  -- color_scheme = "Tomorrow (dark) (terminal.sexy)",






  -- FONT
  font_size = 16,
  line_height = 1.8,
  leader = { key = "a", mods = "OPT" },
  -- TABAR
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  tab_max_width = 200,
  show_new_tab_button_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_and_split_indices_are_zero_based = true,
  enable_tab_bar = true,
  -- WINDOW
  window_background_opacity = 1.0,
  window_decorations = "RESIZE",
  window_frame = window_frame,
  font = font,
  colors = colors,
  launch_menu = launch_menu,
  background = background,
  keys = keys,
}
