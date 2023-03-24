require("lualine").setup {
	options = {
		icons_enabled = false,
	},
	tabline = {
		lualine_a = {
			{
				'tabs',
				mode = 3,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				'buffers',
				mode = 4,
			}

		},
	},
}
