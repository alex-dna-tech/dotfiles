vim.o.background = "dark"

vim.cmd [[
try
  colorscheme gruvbox

  set guicursor=n-v-c:block,i-ci-ve:ver100,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
catch /^Vim\%((\a\+)\)\=:E185/
  set background=dark
  colorscheme default
endtry
]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
