lua require("telescope-conf")

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gbr :lua require('telescope-conf').git_branches()<CR>

" Project
nnoremap <silent><nowait><leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('telescope-conf').search_dotfiles()<CR>
nnoremap <leader>gco :lua require('telescope-conf').git_branches()<CR>
