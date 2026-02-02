return {
	"vrischmann/tree-sitter-templ",
	ft = { "templ" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		vim.filetype.add({ extension = { templ = "templ" } })
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.templ",
			callback = function()
				vim.cmd("TSBufEnable highlight")
			end,
		})

		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		vim.lsp.config("templ", {
			capabilities = capabilities,
		})

		-- vim.lsp.config("tailwindcss", {
		-- 	capabilities = capabilities,
		-- 	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
		-- 	init_options = { userLanguages = { templ = "html" } },
		-- })

		vim.lsp.config("html", {
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		vim.lsp.config("htmx", {
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})
	end,
}
