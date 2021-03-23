" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

if has("autocmd")
  autocmd BufWritePost .init.vim source $MYVIMRC
  autocmd BufReadPost fugitive://* set bufhidden=delete
  set completeopt=noinsert,menuone,noselect
endif

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"Error Buffers
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap go :BufOnly<CR>
nnoremap gb :ls<CR>:b<Space>

" Windows
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" PSQL
au BufRead */psql.edit.* set syntax=sql

map <F1> nop
imap <F1> nop


