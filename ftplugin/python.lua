require("core.formatter").setup("python")

require("lsp").setup(LV.lang.python.lsp)

require("lint").linters_by_ft = {
	python = LV.lang.python.linters,
}

-- TODO get from dap
-- require("lang.python").dap()
