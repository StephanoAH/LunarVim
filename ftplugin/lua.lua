require("core.formatter").setup("lua")

require("lsp").setup(LV.lang.lua.lsp)

require("lint").linters_by_ft = {
	lua = LV.lang.lua.linters,
}
