return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = true,
        windows = true,
        nav = false,
        z = true,
        g = true,
      },
    },
    layout = {
      align = "center",
      spacing = 0,
    },
    -- ignore_missing = true,

  }
}
