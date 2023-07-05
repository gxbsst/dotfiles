return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "css", "python", "javascript", "lua", "html", "typescript", "rust", "cpp", "bash", "scss", "dockerfile",
      "git_config", "git_rebase", "gitcommit", "gitattributes", "awk",
      "jq", "jsdoc", "json", "json5", "markdown", "markdown_inline", "tsx", "yaml"
    }
    opts.rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      -- disable = { "jsx", "cpp" },
      -- Which query to use for finding delimiters
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = require 'ts-rainbow.strategy.global',
      -- Do not enable for files with more than n lines
      max_file_lines = 3000
    }
    return opts
  end
}
