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
