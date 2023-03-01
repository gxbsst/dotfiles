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
	foreground = "#fbf1c7",
	background = "#1d2021",

	cursor_bg = "#928374",
	cursor_fg = "black",
	cursor_border = "#928374",

	selection_fg = "#928374",
	selection_bg = "#ebdbb2",

	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#1d2021", -- black, color 0
		"#cc241d", -- red, color 1
		"#98971a", -- green, color 2
		"#d79921",
		"#458588",
		"#b16286",
		"#689d6a",
		"#a89984",
	},
	brights = {
		"#7c6f64", -- black, color 0
		"#fb4934", -- red, color 1
		"#b8bb26", -- green, color 2
		"#fabd2f",
		"#83a598",
		"#d3869b",
		"#8ec07c",
		"#fbf1c7",
	},
}


return {
  color = color,
  	launch_menu = launch_menu,
  background = {
    {
      source = {
        File = '/Users/weston/dotfiles/RED_LOGO.png',
      },
      width = 'Cover',
      height = 'Cover',

      opacity = 1.0,
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = "Center",
      hsb = dimmer,
      -- attachment = { Parallax = 0.3 },

    }
  },
  -- window_background_image = '/Users/weston/dotfiles/RED_LOGO.png',
  window_background_opacity = 1.0,
  -- window_background_image_hsb = {
  --   -- Darken the background image by reducing it to 1/3rd
  --   brightness = 0.05,

  --   -- You can adjust the hue by scaling its value.
  --   -- a multiplier of 1.0 leaves the value unchanged.
  --   hue = 1.0,

  --   -- You can adjust the saturation also.
  --   saturation = 1.0,
  -- },

  -- FONT
  font_size = 15,
  line_height = 1.6,
  leader = { key = "a", mods = "OPT" },
  window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#000000',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#000000',
  },

  -- TABAR
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,
  show_new_tab_button_in_tab_bar = false,
  colors = {
    tab_bar = {
      inactive_tab_edge = '#000000',
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = '#0b0022',

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#2b2042',
        -- The color of the text for the tab
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
  },
  keys = {
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

  },
  --  color_scheme = 'Galaxy',
  --  color_scheme = "Gruvbox (Gogh)",
  --  color_scheme = "Gruvbox dark, medium (base16)",
  color_scheme = 'carbonfox',
  hide_tab_bar_if_only_one_tab = true,
  tab_and_split_indices_are_zero_based = true,
  enable_tab_bar = true,
  window_decorations = "RESIZE",

  -- font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),
  -- font = wezterm.font('Monaco', { weight = 'Bold', italic = false }),

  font = wezterm.font_with_fallback {
    {
      family = 'JetBrains Mono',
      --  family = 'Monaco',
      -- weight = 'Medium',
      -- weight = 'Bold',
      weight = 'Bold',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    },
    --  { family = 'Terminus', weight = 'Bold' },
    { family = 'JetBrains Mono', weight = 'Bold' },

    'Noto Color Emoji',
  },
}
