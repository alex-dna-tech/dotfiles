local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local parse = require("luasnip.util.parser").parse_snippet
local extras = require("luasnip.extras")
local rep = extras.rep

-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local l = extras.lambda
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("go", {
  parse(
    'abc',
    'alphabet ${1}(${2}) \n{\n\t${3}\n}'),
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({ path = "~/dotfiles/nvim/snippets" })
require("luasnip.loaders.from_lua").load({ paths = { "~/dotfiles/nvim/luasnippets" } })
