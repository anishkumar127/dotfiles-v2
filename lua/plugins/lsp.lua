if true then return {} end
-- local lspconfig = require("lspconfig")
-- local mason = require("mason")
-- local mason_lspconfig = require("mason-lspconfig")

-- Formatter
-- :lua require('conform').format()
-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		javascript = { "prettier" },
-- 		typescript = { "prettier" },
-- 		typescriptreact = { "prettier" }, -- For React (TypeScript)
-- 		javascriptreact = { "prettier" }, -- For React (JavaScript)
-- 		html = { "prettier" },
-- 		css = { "prettier" },
-- 		scss = { "prettier" },
-- 		jsx = { "prettier" }, -- For React (JSX)
-- 		tsx = { "prettier" }, -- For React (TSX)
-- 		json = { "prettier" },
-- 		-- python = { "black" },
-- 		-- go = { "gofmt", "goimports" },
-- 		lua = { "stylua" },
-- 		proto = { "buf" },
-- 	},
-- 	debug = true, -- Enable debugging
-- 	timeout = 20000, -- Timeout in milliseconds (adjust as needed)
-- })

-- Autoformat on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })
-- ----------------------------------------------------------

-- Lua Language Server Setup
-- lspconfig.lua_ls.setup({
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Lua version (LuaJIT is used in Neovim)
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				-- Recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 				checkThirdParty = false, -- Avoid prompts for third-party libraries
-- 			},
-- 			telemetry = {
-- 				enable = false, -- Disable telemetry for privacy
-- 			},
-- 		},
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		local opts = { noremap = true, silent = true }
-- 		-- Keybindings for LSP
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	end,
-- })

----------------------------------------------------------------------

-- Ensure the LSP servers are installed
-- mason.setup()
-- mason_lspconfig.setup({
-- 	ensure_installed = {
-- 		-- "pyright",
-- 		"ts_ls",
-- 		-- "gopls",
-- 		-- "clangd",
-- 		-- "jdtls",
-- 		"html",
-- 		"cssls",
-- 		"yamlls",
-- 		"tailwindcss",
-- 		"lua_ls",
-- 	}, -- Correct server names
-- 	automatic_installation = true,
-- })

-- Set up LSP keymaps and capabilities
-- local on_attach = function(client, bufnr)
-- 	if client.server_capabilities.codeLensProvider then
-- 		client.server_capabilities.codeLensProvider = false
-- 	end
-- 	local opts = { noremap = true, silent = true }
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)

-- 	-- Enable completion with nvim-cmp
-- 	require("cmp").setup.buffer({ sources = { { name = "nvim_lsp" } } })
-- end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ////////////////////////////////////////////////////////

-- lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })

-- /////////////////////////////////////////////

-- require("lspconfig").pyright.setup({
-- 	on_attach = function(client, bufnr)
-- 		-- Enable format on save
-- 		if client.server_capabilities.documentFormattingProvider then
-- 			vim.api.nvim_buf_set_keymap(
-- 				bufnr,
-- 				"n",
-- 				"<leader>f",
-- 				":lua vim.lsp.buf.format({ async = true })<CR>",
-- 				{ noremap = true, silent = true }
-- 			)

-- 			-- Auto format on save
-- 			vim.cmd([[
--         augroup format_on_save
--           autocmd!
--           autocmd BufWritePre *.py lua vim.lsp.buf.format({ async = true })
--         augroup END
--       ]])
-- 		end
-- 	end,
-- 	settings = {
-- 		python = {
-- 			codelenses = { generate = false },
-- 			analysis = {
-- 				typeCheckingMode = "basic", -- Options: off | basic | strict
-- 				autoSearchPaths = true, -- Automatically add search paths
-- 				useLibraryCodeForTypes = true, -- Use the library code for type checking
-- 			},
-- 		},
-- 	},
-- })

-- //////////////////////////////////////////////////////////
-- C/C++
-- lspconfig.clangd.setup({

-- 	filetypes = {
-- 		"c",
-- 		"cpp",
-- 		"objc",
-- 		"objcpp",
-- 		"cuda",
-- 	},

-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- //////////////////////////////////////////////////////////

-- lspconfig.dockerls.setup({
-- 	cmd = { "docker-langserver", "--stdio" },
-- })

-- ///////////////////////////////////////////////////////////

-- Setup yamlls (YAML Language Server)
-- lspconfig.yamlls.setup({
-- 	settings = {
-- 		yaml = {
-- 			codelenses = { generate = false },
-- 			schemas = {
-- 				-- Correct Kubernetes schema URL from the official Kubernetes repository
-- 				["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json"] = "*.yaml", -- Kubernetes schema
-- 			},
-- 		},
-- 	},
-- })

-- //////////////////////////////////////////////////////////

-- Go LSP

-- require("lspconfig").gopls.setup({
-- 	settings = {
-- 		gopls = {
-- 			directoryFilters = { "-node_modules", "-vendor", "-.git" },
-- 			analyses = {
-- 				unusedparams = true,
-- 				shadow = true,
-- 				fieldalignment = true,
-- 				nilness = true,
-- 			},
-- 			staticcheck = true,
-- 			semanticTokens = true,
-- 			codelenses = { generate = false }, -- Disable unused features like code lenses
-- 		},
-- 	},
-- 	flags = {
-- 		debounce_text_changes = 150, -- Reduce the frequency of text synchronization
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		client.server_capabilities.documentFormattingProvider = false -- Disable LSP formatting if it conflicts
-- 		local opts = { noremap = true, silent = true }
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	end,
-- })
-- Auto format on save for Go files

-- /////////////////////////////////////////////////

-- require("lspconfig").html.setup({
-- 	cmd = { "C:\\Users\\Lenovo\\AppData\\Local\\nvim-data\\mason\\bin\\vscode-html-language-server.cmd", "--stdio" },
-- 	capabilities = capabilities,
-- 	on_attach = function(client, bufnr)
-- 		if client.server_capabilities.codeLensProvider then
-- 			client.server_capabilities.codeLensProvider = false
-- 		end
-- 		-- Enable auto-format on save
-- 		if client.server_capabilities.documentFormattingProvider then
-- 			vim.api.nvim_buf_set_keymap(
-- 				bufnr,
-- 				"n",
-- 				"<leader>f",
-- 				":lua vim.lsp.buf.format({ async = true })<CR>",
-- 				{ noremap = true, silent = true }
-- 			)
-- 			-- Auto-format on save
-- 			vim.cmd([[
--               augroup AutoFormat
--                   autocmd!
--                   autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
--               augroup END
--           ]])
-- 		end
-- 	end,
-- })

-- require("lspconfig").cssls.setup({
-- 	cmd = { "C:\\Users\\Lenovo\\AppData\\Local\\nvim-data\\mason\\bin\\vscode-css-language-server.cmd", "--stdio" },
-- 	capabilities = capabilities,
-- 	on_attach = function(client, bufnr)
-- 		if client.server_capabilities.codeLensProvider then
-- 			client.server_capabilities.codeLensProvider = false
-- 		end
-- 		-- Enable auto-format on save
-- 		if client.server_capabilities.documentFormattingProvider then
-- 			vim.api.nvim_buf_set_keymap(
-- 				bufnr,
-- 				"n",
-- 				"<leader>f",
-- 				":lua vim.lsp.buf.format({ async = true })<CR>",
-- 				{ noremap = true, silent = true }
-- 			)
-- 			-- Auto-format on save
-- 			vim.cmd([[
--               augroup AutoFormat
--                   autocmd!
--                   autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
--               augroup END
--           ]])
-- 		end
-- 	end,
-- })

-- ////////////////////////////////////////////////////////////////////

-- require("lspconfig").tailwindcss.setup({
-- 	cmd = { "tailwindcss-language-server", "--stdio" },
-- 	filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
-- })

-- ///////////////////////////////////////////
--
-- //////////////////////////////////////////
--
-- -- Set up LSP for Java with nvim-jdtls

-- lspconfig.jdtls.setup({
-- 	cmd = { "jdtls" }, -- Path to jdtls executable
-- 	root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
-- 	settings = {
-- 		java = {
-- 			codelenses = { generate = false },
-- 			-- Custom formatting settings
-- 			format = {
-- 				enabled = true, -- Enable auto-formatting
-- 				settings = {
-- 					-- Assuming you will format manually for now
-- 					url = "C:/java-formatter/google-java-format.jar", -- Update path if needed
-- 				},
-- 			},
-- 		},
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		-- Optional: Trigger manual formatting on space+f
-- 		vim.api.nvim_buf_set_keymap(
-- 			bufnr,
-- 			"n",
-- 			"<leader>f",
-- 			":lua FormatJavaFile()<CR>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 	end,
-- })

-- Function to format using google-java-format without prompting for confirmation

-- function FormatJavaFile()
-- 	-- Save the file before formatting
-- 	vim.cmd("write")

-- 	-- Get the current file path
-- 	local filename = vim.fn.expand("%:p")

-- 	-- Run the external formatter
-- 	vim.fn.system("C:/java-formatter/google-java-format.exe --replace " .. filename)

-- 	-- Reload the file to apply the formatting
-- 	vim.cmd("e!") -- The `e!` command will reload the buffer, discarding any unsaved changes.
-- end
-- Optional: Bind formatting to save
-- vim.cmd([[
--   augroup LspFormatting
--     autocmd! * <buffer>
--     autocmd BufWritePre *.java lua FormatJavaFile()
--   augroup END
-- ]])

-- :!C:/java-formatter/google-java-format.exe --replace %