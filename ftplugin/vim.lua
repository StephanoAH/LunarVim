require("lsp").setup(LV.lang.vim.lsp)

require("lint").linters_by_ft = {
	vim = LV.lang.vim.linters,
}
