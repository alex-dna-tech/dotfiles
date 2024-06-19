local lsp = require('lsp-zero').preset('recommended')
lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)
lsp.setup()

-- NVIM cmp
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
vim.keymap.set({ 'i', 's' }, '<C-l>', function() luasnip.change_choice(1) end, { noremap = true, silent = true })
vim.keymap.set({ 'i', 's' }, '<C-S-l>', function() luasnip.change_choice(-1) end, { noremap = true, silent = true })

local cmp = require("cmp")
cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-CR>"] = cmp.mapping.complete(),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-e>'] = cmp.mapping.abort(),

    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
      { name = 'codeium' },
      { name = 'luasnip',  keyword_length = 2, option = { show_autosnippets = true }, priority = 1000 },
      { name = 'nvim_lsp', keyword_length = 3, priority = 900 },
      { name = 'path',     keyword_length = 2, priority = 800 },
    },
    {
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer',                 keyword_length = 3, priority = 700 },
    })
})

cmp.config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}

vim.cmd [[
autocmd FileType TelescopePrompt lua require("cmp").setup.buffer { enabled = false }
]]

-- LSP config
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

-- Mason LSP
local mason_lsp_config = require("mason-lspconfig")
local capabilities =
    require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
local on_attach = function(client, _)
  -- Disabled lsp formatting
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
end
mason_lsp_config.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  ["lua_ls"] = function(_)
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
})
