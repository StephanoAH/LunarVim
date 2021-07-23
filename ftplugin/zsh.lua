require("core.formatter").setup("sh")

require("lint").linters_by_ft = {
	sh = LV.lang.sh.linters,
}

require("lsp").setup(LV.lang.sh.lsp)
