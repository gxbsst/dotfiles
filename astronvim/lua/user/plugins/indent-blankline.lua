return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    vim.opt.listchars:append("space: ")
    vim.opt.listchars:append("eol: ")
    opts.show_trailing_blankline_indent = true
    opts.show_current_context_start = true
    opts.space_char_blankline = " "
    opts.show_current_context = true

    opts.char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    }
    return opts
  end
}
