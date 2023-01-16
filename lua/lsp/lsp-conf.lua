local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local status_mason, masonlsp = pcall(require, "mason-lspconfig")
if not status_mason then
	return
end

local status_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_lsp then
	return
end

local status_lspsaga, lspsaga = pcall(require, "lspsaga")
if not status_lspsaga then
	return
end

local status_navic, navic = pcall(require, "nvim-navic")
if not status_navic then
	return
end

local status_rt, rt = pcall(require, "rust-tools")
if not status_rt then
	return
end

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
})

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	buf_set_keymap("n", "<leader>fr", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = masonlsp.get_installed_servers()

for _, server in ipairs(servers) do
	nvim_lsp[server].setup({
		server = server,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--[[ nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
} ]]

--[[ nvim_lsp.rust_analyzer.setup({
	-- on_attach is a callback called when the language server attachs to the buffer
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
}) ]]

--[[ nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}) ]]

--[[ nvim_lsp.tailwindcss.setup {} ]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
