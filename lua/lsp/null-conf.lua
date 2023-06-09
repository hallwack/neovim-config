local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.blade_formatter,
		null_ls.builtins.formatting.black,
    --[[ null_ls.builtins.formatting.stylelint, ]]
		null_ls.builtins.code_actions.eslint_d,
		--[[ null_ls.builtins.formatting.eslint_d, ]]
	},
})
