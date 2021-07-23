require("core.formatter").setup("terraform")
LV.formatters.filetype["tf"] = LV.formatters.filetype["terraform"]
LV.formatters.filetype["hcl"] = LV.formatters.filetype["terraform"]

require("lsp").setup(LV.lang.terraform.lsp)
