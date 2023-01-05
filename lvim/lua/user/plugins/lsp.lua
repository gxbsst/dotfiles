require "user.plugins.lsp.languages.rust"
-- require "user.plugins.lsp.languages.go"
require "user.plugins.lsp.languages.python"
require "user.plugins.lsp.languages.js-ts"
require "user.plugins.lsp.languages.sh"

lvim.lsp.diagnostics.virtual_text = true

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "java",
-- }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
  { command = "stylua", filetypes = { "lua" } },

  { command = "shfmt", filetypes = { "sh", "zsh" } },
}

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript" } },
}
