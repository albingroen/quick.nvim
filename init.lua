-- Basic settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.wo.wrap = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.laststatus = 3
vim.opt.pumheight = 10
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

-- Helpers
local function change_colorscheme()
	local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
	m = m:gsub("%s+", "") -- trim whitespace
	if m == "Dark" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
end

-- Basic mappings
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-S>", ":%s/")
vim.keymap.set("n", "sp", ":sp<CR>")
vim.keymap.set("n", "tj", ":tabprev<CR>")
vim.keymap.set("n", "tk", ":tabnext<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "to", ":tabo<CR>")
vim.keymap.set("n", "vs", ":vs<CR>")
vim.keymap.set("n", "<leader>j", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>k", ":cprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", ":tabonly<cr>:only<CR>", { silent = true })

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
	-- Automatic indentation
	"tpope/vim-sleuth",

	-- Better navigation between Neovim and Kitty
	"knubie/vim-kitty-navigator",

	-- Autoclose HTML-style tags
	"windwp/nvim-ts-autotag",

	-- Easy commenting in normal & visual mode
	{ "numToStr/Comment.nvim", lazy = false },
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },

	-- Code assistant
	{
		"robitx/gp.nvim",
		opts = {},
	},

	-- File explorer
	{
		"stevearc/oil.nvim",
		lazy = false,
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
				default_file_explorer = true,
			})
		end,
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		opts = {
			pickers = {
				git_branches = { previewer = false, theme = "ivy", show_remote_tracking_branches = false },
				git_commits = { previewer = false, theme = "ivy" },
				grep_string = { previewer = false, theme = "ivy" },
				diagnostics = { previewer = false, theme = "ivy" },
				find_files = { previewer = false, theme = "ivy" },
				buffers = { previewer = false, theme = "ivy" },
				current_buffer_fuzzy_find = { theme = "ivy" },
				resume = { previewer = false, theme = "ivy" },
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
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Better syntax highlighting & much more
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = "all",
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true, enable_close_on_slash = false },
			})
		end,
	},

	-- Colorscheme
	{
		"mcchrish/zenbones.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			change_colorscheme()

			vim.g.zenbones_compat = true

			vim.cmd("colorscheme zenbones")
		end,
	},

	-- Surround words with characters in normal mode
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},

	-- For formatting code
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				graphql = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {},
		},
	},

	-- Pair matching characters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
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
		end,
	},
})

-- Open Telescope on start
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end
	end,
})

-- Set up Comment.nvim
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

-- Set up Mason and install set up language servers
require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

-- Global LSP mappings
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- More LSP mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>.", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

-- Set up nvim-cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp", max_item_count = 5 },
		{ name = "buffer", max_item_count = 5 },
		{ name = "path", max_item_count = 3 },
		{ name = "luasnip", max_item_count = 3 },
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
			return vim_item
		end,
	},
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
