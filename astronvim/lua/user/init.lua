-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		_G.THEME = require("user.util.theme").setup()
-- 	end
-- })

return {
	-- Auto Format
	["null-ls"] = function()
		local status_ok, null_ls = pcall(require, "null-ls")
		if status_ok then
			null_ls.setup {
				debug = false,
				sources = {
					null_ls.builtins.formatting.prettier,
				},
				on_attach = function(client)
					if client.resolved_capabilities.document_formatting then
						vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
					end
				end,
			}
		end
	end,
	-- LSP
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
