--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

LV.format_on_save = true
LV.lint_on_save = true
LV.completion.autocomplete = true
LV.colorscheme = "spacegray"
-- keymappings
LV.keys.leader_key = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- LV.keys.normal_mode = {
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("lv-utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
LV.plugin.dashboard.active = true
LV.plugin.terminal.active = true
LV.plugin.nvimtree.side = "left"
LV.plugin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
LV.treesitter.ensure_installed = "maintained"
LV.treesitter.ignore_install = { "haskell" }
LV.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- LV.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- python
LV.lang.python.diagnostics.virtual_text = true
LV.lang.python.analysis.use_library_code_types = true
-- To change default formatter from yapf to black
-- LV.lang.python.formatter.exe = "black"
-- LV.lang.python.formatter.args = {"-"}
-- To change enabled linters
-- https://github.com/mfussenegger/nvim-lint#available-linters
-- LV.lang.python.linters = { "flake8", "pylint", "mypy", ... }

-- go
-- To change default formatter from gofmt to goimports
-- LV.lang.formatter.go.exe = "goimports"

-- javascript
LV.lang.tsserver.linter = nil

-- rust
-- LV.lang.rust.rust_tools = true
-- LV.lang.rust.formatter = {
--   exe = "rustfmt",
--   args = {"--emit=stdout", "--edition=2018"},
-- }

-- scala
-- LV.lang.scala.metals.active = true
-- LV.lang.scala.metals.server_version = "0.10.5",

--LaTeX
-- Options: https://github.com/latex-lsp/texlab/blob/master/docs/options.md
LV.lang.latex.active = true
LV.lang.latex.aux_directory = "."
LV.lang.latex.bibtex_formatter = "texlab"
LV.lang.latex.build.args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" }
LV.lang.latex.build.executable = "latexmk"
LV.lang.latex.build.forward_search_after = false
LV.lang.latex.build.on_save = false
LV.lang.latex.chktex.on_edit = false
LV.lang.latex.chktex.on_open_and_save = false
LV.lang.latex.diagnostics_delay = 300
LV.lang.latex.formatter_line_length = 80
LV.lang.latex.forward_search.executable = "zathura"
LV.lang.latex.latex_formatter = "latexindent"
LV.lang.latex.latexindent.modify_line_breaks = false
-- LV.lang.latex.auto_save = false
-- LV.lang.latex.ignore_errors = { }

-- Additional Plugins
-- LV.user_plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- LV.autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
