LV.formatters.filetype["rmd"] = LV.formatters.filetype["r"]
require("core.formatter").setup("r")
-- R -e 'install.packages("languageserver",repos = "http://cran.us.r-project.org")'
require("lsp").setup(LV.lang.r.lsp)
