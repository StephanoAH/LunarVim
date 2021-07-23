require("core.formatter").setup("html")

require("lsp").setup(LV.lang.html.lsp)

require("lint").linters_by_ft = {
	html = LV.lang.html.linters,
}
