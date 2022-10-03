local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		side = "right",
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules", ".cache", ".bin" },
	},
	git = { enable = true, ignore = true },
})
