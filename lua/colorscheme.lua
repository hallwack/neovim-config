vim.cmd [[ colorscheme kanagawa ]]
--vim.cmd[[ colorscheme minimal ]]

--[[local status, everblush = pcall(require, "everblush")
if not status then
	return
end

--[[local colors = require("everblush.core").get_colors()

everblush.setup({
	nvim_tree = { contrast = false },
	-- transparent_background = true,
	override = {
		LineNr = {
			fg = colors.color12,
		},
	},
}) -- or use contrast = false to not apply contrast]]

--vim.cmd[[ colorscheme poimandres]]

--[[local status, poimandres = pcall(require, "poimandres")
if not status then
	return
end

poimandres.setup {}]]
