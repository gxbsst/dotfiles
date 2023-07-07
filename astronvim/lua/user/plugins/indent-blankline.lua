return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    opts.space_char_blankline = " "
    opts.show_current_context = true
    opts.show_current_context_start = true
    opts.show_trailing_blankline_indent = true
    return opts
  end
}
