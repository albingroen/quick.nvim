return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	opts = {
		pickers = {
			git_branches = { previewer = false, theme = "ivy", show_remote_tracking_branches = false },
			git_commits = { previewer = false, theme = "ivy" },
			grep_string = { previewer = false, theme = "ivy" },
			diagnostics = { previewer = false, theme = "ivy" },
			find_files = { previewer = true, theme = "ivy" },
			buffers = { previewer = false, theme = "ivy" },
			current_buffer_fuzzy_find = { theme = "ivy" },
			resume = { previewer = true, theme = "ivy" },
			live_grep = { theme = "ivy" },
		},
		defaults = {
			layout_config = {
				prompt_position = "bottom",
			},
		},
	},
	keys = {
		{ "<leader>z", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "File fuzzy find" },
		{ "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "Show diagnostics" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
		{ "<leader>w", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>c", "<cmd>Telescope resume<cr>", desc = "Resume search" },
		{ "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	},
}
