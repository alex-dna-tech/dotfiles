vim.o.background = "dark"

vim.cmd [[
try
  colorscheme gruvbox
  autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
  let g:gruvbox_transparent_bg = 1

  set guicursor=n-v-c:block,i-ci-ve:ver100,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
