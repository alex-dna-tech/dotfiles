local options = {
	go_def_mapping_enabled = 0,
	go_fmt_command = "goimports",
	go_autodetect_gopath = 1,
	go_list_type = "quickfix",

	go_highlight_types = 1,
	go_highlight_fields = 1,
	go_highlight_functions = 1,
	go_highlight_methods = 1,
	go_highlight_extra_types = 1,
	go_highlight_generate_tags = 1,
	syntastic_go_checkers = { "go", "golint", "errcheck" },
}

for k, v in pairs(options) do
	vim.g[k] = v
end

vim.cmd [[
  augroup _vim_go
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

    " run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
      let l:file = expand('%')
      if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
      elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
      endif
    endfunction

    autocmd FileType go nmap <leader>b  :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>B  <Plug>(go-test)
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <Leader>i  <Plug>(go-info)
    autocmd FileType go nmap <Leader>v  <Plug>(go-coverage-toggle)

    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  augroup end
]]

