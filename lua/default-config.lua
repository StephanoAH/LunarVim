CONFIG_PATH = os.getenv("HOME") .. "/.local/share/lunarvim/lvim"
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

-- TODO O -> lv
LV = {
	-- TODO Loose options under opt
	keys = {
		leader_key = "space",
	},
	colorscheme = "spacegray",
	line_wrap_cursor_movement = true,
	transparent_window = false,
	format_on_save = true,
	lint_on_save = true,
	vsnip_dir = os.getenv("HOME") .. "/.config/snippets",
	database = { save_location = "~/.config/lunarvim_db", auto_execute = 1 },

	-- TODO why do we need this?
	plugin = {
		lspinstall = {},
		telescope = {},
		compe = {},
		autopairs = {},
		treesitter = {},
		formatter = {},
		lint = {},
		nvimtree = {},
		gitsigns = {},
		which_key = {},
		comment = {},
		rooter = {},
		galaxyline = {},
		bufferline = {},
		dap = {},
		dashboard = {},
		terminal = {},
	},

	lsp = {
		diagnostics = {
			virtual_text = {
				prefix = "",
				spacing = 0,
			},
			signs = true,
			underline = true,
		},
		document_highlight = true,
		popup_border = "single",
		default_keybinds = true,
		on_attach_callback = nil,
	},

	plugins = {
		-- use lv-config.lua for this not put here
	},

	autocommands = {
		{ "FileType", "qf", "set nobuflisted" },
	},

	-- TODO hide this
	formatters = {
		filetype = {},
	},
	lang = {},
}

-- TODO move all of this into lang specific files, only require when using
LV.lang = {
	c = {
		formatter = {
			exe = "clang-format",
			args = {},
			stdin = true,
		},
		linters = {
			"cppcheck",
			"clangtidy",
		},
		lsp = {
			provider = "clangd",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
					"--background-index",
					"--header-insertion=never",
					"--cross-file-rename",
					"--clang-tidy",
					"--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	csharp = {
		lsp = {
			provider = "omnisharp",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/csharp/omnisharp/run",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	cmake = {
		formatter = {
			exe = "clang-format",
			args = {},
		},
		lsp = {
			provider = "cmake",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/cmake/venv/bin/cmake-language-server",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	clojure = {
		lsp = {
			provider = "clojure_lsp",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/clojure/clojure-lsp",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	css = {
		formatter = {
			exe = "prettier",
			args = {},
		},
		lsp = {
			provider = "cssls",
			setup = {
				cmd = {
					"node",
					DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	dart = {
		lsp = {
			provider = "dartls",
			setup = {
				cmd = {
					"dart",
					"/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
					"--lsp",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
		formatter = {
			exe = "dart",
			args = { "format" },
			stdin = true,
		},
	},
	docker = {
		lsp = {
			provider = "dockerls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	elixir = {
		formatter = {
			exe = "mix",
			args = { "format" },
			stdin = true,
		},
		lsp = {
			provider = "elixirls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/elixir/elixir-ls/language_server.sh",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	elm = {
		lsp = {
			provider = "elmls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-language-server",
				},
				on_attach = require("lsp").common_on_attach,
				init_options = {
					elmAnalyseTrigger = "change",
					elmFormatPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-format",
					elmPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/",
					elmTestPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-test",
				},
			},
		},
	},
	erlang = {
		lsp = {
			provider = "erlangls",
			setup = {
				cmd = {
					"erlang_ls",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	efm = {},
	emmet = { active = false },
	go = {
		formatter = {
			exe = "gofmt",
			args = {},
			stdin = true,
		},
		linters = {
			"golangcilint",
			"revive",
		},
		lsp = {
			provider = "gopls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/go/gopls",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	graphql = {
		lsp = {
			provider = "graphql",
			setup = {
				cmd = {
					"graphql-lsp",
					"server",
					"-m",
					"stream",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	html = {
		linters = {
			"tidy",
			-- https://docs.errata.ai/vale/scoping#html
			"vale",
		},
		lsp = {
			provider = "html",
			setup = {
				cmd = {
					"node",
					DATA_PATH
						.. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	java = {
		formatter = {
			exe = "prettier",
			args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		},
		lsp = {
			provider = "jdtls",
			setup = {
				cmd = { DATA_PATH .. "/lspinstall/java/jdtls.sh" },
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	json = {
		formatter = {
			exe = "python",
			args = { "-m", "json.tool" },
			stdin = true,
		},
		lsp = {
			provider = "jsonls",
			setup = {
				cmd = {
					"node",
					DATA_PATH
						.. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
				settings = {
					json = {
						schemas = require("nlspsettings.jsonls").get_default_schemas(),
						--   = {
						--   {
						--     fileMatch = { "package.json" },
						--     url = "https://json.schemastore.org/package.json",
						--   },
						-- },
					},
				},
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
						end,
					},
				},
			},
		},
	},
	julia = {
		lsp = {
			provider = "julials",
			setup = {
				{
					"julia",
					"--startup-file=no",
					"--history-file=no",
					-- vim.fn.expand "~/.config/nvim/lua/lsp/julia/run.jl",
					CONFIG_PATH .. "/utils/julia/run.jl",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	kotlin = {
		lsp = {
			provider = "kotlin_language_server",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/kotlin/server/bin/kotlin-language-server",
				},
				on_attach = require("lsp").common_on_attach,
				root_dir = function(fname)
					local util = require("lspconfig/util")

					local root_files = {
						"settings.gradle", -- Gradle (multi-project)
						"settings.gradle.kts", -- Gradle (multi-project)
						"build.xml", -- Ant
						"pom.xml", -- Maven
					}

					local fallback_root_files = {
						"build.gradle", -- Gradle
						"build.gradle.kts", -- Gradle
					}
					return util.root_pattern(unpack(root_files))(fname)
						or util.root_pattern(unpack(fallback_root_files))(fname)
				end,
			},
		},
	},
	lua = {
		formatter = {
			exe = "stylua",
			args = {},
			stdin = false,
			tempfile_prefix = ".formatter",
		},
		linters = { "luacheck" },
		lsp = {
			provider = "sumneko_lua",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
					"-E",
					DATA_PATH .. "/lspinstall/lua/main.lua",
				},
				on_attach = require("lsp").common_on_attach,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							-- Setup your lua path
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim", "O" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								[vim.fn.expand("~/.local/share/lunarvim/lvim/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 1000,
						},
					},
				},
			},
		},
	},
	php = {
		formatter = {
			exe = "phpcbf",
			args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
			stdin = false,
			tempfile_prefix = ".formatter",
		},
		linters = {},
		lsp = {
			provider = "intelephense",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				filetypes = { "php", "phtml" },
				settings = {
					intelephense = {
						environment = {
							phpVersion = "7.4",
						},
					},
				},
			},
		},
	},
	python = {
		-- @usage can be flake8 or yapf
		formatter = {
			exe = "yapf",
			args = {},
			stdin = true,
		},
		linters = {
			"flake8",
			"pylint",
			"mypy",
		},
		lsp = {
			provider = "pyright",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	-- R -e 'install.packages("formatR",repos = "http://cran.us.r-project.org")'
	-- R -e 'install.packages("readr",repos = "http://cran.us.r-project.org")'
	r = {
		formatter = {
			exe = "R",
			args = {
				"--slave",
				"--no-restore",
				"--no-save",
				'-e "formatR::tidy_source(text=readr::read_file(file(\\"stdin\\")), arrow=FALSE)"',
			},
			stdin = true,
		},
		lsp = {
			provider = "r_language_server",
			setup = {
				cmd = {
					"R",
					"--slave",
					"-e",
					"languageserver::run()",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	ruby = {
		formatter = {
			exe = "rufo",
			args = { "-x" },
			stdin = true,
		},
		linters = { "ruby" },
		lsp = {
			provider = "solargraph",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph",
					"stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	rust = {
		formatter = {
			exe = "rustfmt",
			args = { "--emit=stdout", "--edition=2018" },
			stdin = true,
		},
		diagnostics = {
			virtual_text = { spacing = 0, prefix = "" },
			signs = true,
			underline = true,
		},
		lsp = {
			provider = "rust_analyzer",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/rust/rust-analyzer",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	sh = {
		-- @usage can be 'shellcheck'
		linter = "",
		-- @usage can be 'shfmt'
		formatter = {
			exe = "shfmt",
			args = { "-w" },
			stdin = false,
		},
		linters = { "shellcheck" },
		lsp = {
			provider = "bashls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server",
					"start",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	svelte = {
		lsp = {
			provider = "svelte",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/svelte/node_modules/.bin/svelteserver",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	swift = {
		formatter = {
			exe = "swiftformat",
			args = {},
			stdin = true,
		},
		lsp = {
			provider = "sourcekit",
			setup = {
				cmd = {
					"xcrun",
					"sourcekit-lsp",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	tailwindcss = {
		active = false,
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	terraform = {
		formatter = {
			exe = "terraform",
			args = { "fmt" },
			stdin = false,
		},
		lsp = {
			provider = "terraformls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/terraform/terraform-ls",
					"serve",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	tsserver = {
		-- @usage can be 'eslint' or 'eslint_d'
		linter = "",
		diagnostics = {
			virtual_text = { spacing = 0, prefix = "" },
			signs = true,
			underline = true,
		},
		formatter = {
			exe = "prettier",
			args = {},
		},
	},
	vim = {
		linters = { "vint" },
		lsp = {
			provider = "vimls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	vue = {
		formatter = {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				"${FILEPATH}",
			},
			stdin = true,
		},
		lsp = {
			provider = "vetur",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	yaml = {
		formatter = {
			exe = "prettier",
			args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
			stdin = true,
		},
		lsp = {
			provider = "yamlls",
			setup = {
				cmd = {
					DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server",
					"--stdio",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
	zig = {
		formatter = {
			exe = "zig",
			args = { "fmt" },
			stdin = false,
		},
		lsp = {
			provider = "zls",
			setup = {
				cmd = {
					"zls",
				},
				on_attach = require("lsp").common_on_attach,
				capabilities = require("lsp").common_capabilities(),
			},
		},
	},
}

require("core.which-key").config()
require("core.status_colors")
require("core.gitsigns").config()
require("core.compe").config()
require("core.dashboard").config()
require("core.dap").config()
require("core.terminal").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.nvimtree").config()
