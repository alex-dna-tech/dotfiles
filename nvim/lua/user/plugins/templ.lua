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

		lspconfig.templ.setup({
			capabilities = capabilities,
		})

		-- lspconfig.tailwindcss.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
		-- 	init_options = { userLanguages = { templ = "html" } },
		-- })

		lspconfig.html.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		lspconfig.htmx.setup({
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})
	end,
}
