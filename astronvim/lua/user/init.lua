return {
  lsp = {
    servers = {
      "wxml_lsp",
    },
    setup_handlers = {
      wxml_lsp = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "wxml",
          callback = function()
            local path = vim.fs.find({ "app.json" }, { type = "file" })
            vim.lsp.start({
              name = "wxml-langserver",
              cmd = { "wxml-langserver" },
              root_dir = vim.fs.dirname(path[1]),
              settings = {
              },
            })
          end
        })
      end
    },
    config = {
      wxml_lsp = function(opts)
        local path = vim.fs.find({ "app.json" }, { type = "file" })
        local cmd = { "wxml-langserver" };
        local filetypes = { "wxml" };
        -- local root_dir = vim.fs.dirname(path[1]);
        opts.cmd = cmd;
        opts.filetypes = filetypes;
        opts.root_dir = require("lspconfig.util").root_pattern("app.json");
        return opts;
      end,
    },
  }
}
