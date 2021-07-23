require("core.formatter").setup("go")

require("lint").linters_by_ft = {
	go = LV.lang.go.linters,
}

require("lsp").setup(LV.lang.go.lsp)
