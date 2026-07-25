require("basics")

-- Plugins
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/tinted-theming/tinted-nvim",
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/folke/ts-comments.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

-- Telescope
require("telescope").setup({
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
})

vim.keymap.set("n", "<leader>z", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "File fuzzy find" })
vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>w", "<cmd>Telescope grep_string<cr>", { desc = "Grep string" })
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>c", "<cmd>Telescope resume<cr>", { desc = "Resume search" })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

-- Oil
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	default_file_explorer = true,
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Buffers" })

-- Theme
local theme_script_path = vim.fn.expand("~/.local/share/tinted-theming/tinty/base16-vim-colors-file.vim")

local function file_exists(file_path)
	return vim.fn.filereadable(file_path) == 1 and true or false
end

local function handle_focus_gained()
	if file_exists(theme_script_path) then
		vim.cmd("source " .. theme_script_path)
	end
end

if file_exists(theme_script_path) then
	vim.o.termguicolors = true
	vim.g.tinted_colorspace = 256

	vim.cmd("source " .. theme_script_path)

	vim.api.nvim_create_autocmd("FocusGained", {
		callback = handle_focus_gained,
	})
end

-- Nvim Tmux Navigator
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")

-- Render Markdown
require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})

-- Treesitter & blink.cmp build hooks
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			require("nvim-treesitter").install({
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"jsonc",
				"svelte",
				"python",
				"bash",
				"fish",
				"yaml",
				"toml",
				"go",
				"rust",
			})
		elseif name == "blink.cmp" and kind ~= "delete" then
			require("blink.cmp").build():wait(60000)
		end
	end,
})

-- Treesitter Autotag
require("nvim-ts-autotag").setup()

-- Auto Pairs
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

-- Gitsigns
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-- Conform
require("conform").setup({
	formatters_by_ft = {
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		graphql = { "prettierd" },
		html = { "prettierd", "djlint" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		css = { "prettierd" },
		svelte = { "prettierd" },
		lua = { "stylua" },
		python = { "black" },
	},
	format_on_save = {},
})

-- LSP
require("mason").setup()

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>.", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("<leader>i", "<cmd>TSToolsAddMissingImports<cr>", "TSToolsAddMissingImports")
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
})

vim.lsp.config("*", { capabilities = capabilities })

require("mason-lspconfig").setup()

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = { documentation = { auto_show = true } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})

-- Comments
require("ts-comments").setup()
