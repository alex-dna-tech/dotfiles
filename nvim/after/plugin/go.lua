local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup({
  luasnip = true,
  max_line_len = 80,
  lsp_inlay_hints = {
    enable = true,
  },
  lsp_cfg = true,
})

vim.cmd("autocmd FileType go nmap nl :GoLint")
vim.cmd("autocmd FileType go nmap nc :lua require('go.comment').gen()")
