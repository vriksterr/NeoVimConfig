-- source for repo https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox_dark", -- this theme is taken from here https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
			},
		})
	end,
}
