--[[ require("kanagawa").setup({
	commentStyle = { italic = false },
	keywordStyle = { italic = false },
}) ]]

--vim.cmd([[ colorscheme kanagawa ]])

--vim.cmd[[ colorscheme minimal ]]

--[[ if not status then
  local status, everblush = pcall(require, "everblush")
	return
end

everblush.setup({
	nvim_tree = { contrast = false },
	transparent_background = true,
	override = {
		LineNr = {
			fg = '#71baf2',
		},
    Comment = { fg = '#404749', italic = false },
    ["@comment"] = { fg = '#404749', italic = false },
    ["@text.literal"] = { fg = '#8ccf7e', italic = false },
	},
})

vim.cmd('colorscheme everblush') ]]
-- or use contrast = false to not apply contrast]]

--[[ vim.cmd[[ colorscheme poimandres]]

--[[ local status, poimandres = pcall(require, "poimandres")
if not status then
	return
end

poimandres.setup {} ]]

--[[ vim.g.mellow_italic_comments=false
vim.cmd [[colorscheme mellow]]

--vim.cmd [[colorscheme oh-lucy]]

--[[ require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		dark = "mocha",
	},
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
}) ]]

--vim.cmd("colorscheme catppuccin")

--[[ require("onedark").setup({
	style = "warmer",
})
require("onedark").load() ]]

vim.o.background = 'dark'
local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = false,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#5a5a5a',
        vscBack = "#0F1117",
        vscCursorDarkDark = "#161B23",
        vscTabOutside = "NONE",
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
vim.cmd("colorscheme vscode")

--[[ require('onenord').setup() ]]

---- setup must be called before loading the colorscheme
-- Default options:
--[[ require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = false,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
vim.cmd("colorscheme gruvbox") ]]

--[[ vim.cmd("colorscheme github-colors") ]]

--[[ vim.cmd("colorscheme arctic") ]]

--[[ vim.cmd("colorscheme bloop") ]]
