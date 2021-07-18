nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gf :Git diff<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>

" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

