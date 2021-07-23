require("core.formatter").setup("ruby")

require("lint").linters_by_ft = {
	ruby = LV.lang.ruby.linters,
}

-- also support sorbet
require("lsp").setup(LV.lang.ruby.lsp)
