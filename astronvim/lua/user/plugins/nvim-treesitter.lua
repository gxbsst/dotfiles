return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "css", "python", "javascript", "lua", "html", "typescript", "rust", "cpp", "bash", "scss", "dockerfile",
      "git_config", "git_rebase", "gitcommit", "gitattributes", "awk",
      "jq", "jsdoc", "json", "json5", "markdown", "markdown_inline", "tsx", "yaml"
    }
    return opts
  end
}
