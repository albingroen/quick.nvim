return {
	"stevearc/conform.nvim",
	opts = {
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
	},
}
