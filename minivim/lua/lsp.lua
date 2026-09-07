require("mason").setup()

-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
vim.keymap.set("n", "<leader>l", "", { desc = "+LSP" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Installer Info" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.enable({
    "bashls",
    "gopls",
    "htmx",
    "lua_ls",
    "marksman",
    "pbls",
    "pyright",
    "tailwindcss",
    "templ",
    "ts_ls",
})
