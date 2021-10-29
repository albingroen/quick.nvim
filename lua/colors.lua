vim.g.tokyonight_style = 'night'
vim.cmd[[colorscheme tokyonight]]

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
