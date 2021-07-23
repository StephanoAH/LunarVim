LV.formatters.filetype["cpp"] = LV.formatters.filetype["c"]
LV.formatters.filetype["objc"] = LV.formatters.filetype["c"]
require("core.formatter").setup("c")

require("lsp").setup(LV.lang.c.lsp)

require("lint").linters_by_ft = {
	c = LV.lang.c.linters,
	cpp = LV.lang.c.linters,
}

-- TODO get from dap
-- require("lang.c").dap()
