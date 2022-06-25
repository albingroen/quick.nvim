# quick.nvim

Forked from : [albingroen/quick.nvim](https://github.com/albingroen/quick.nvim)

## Plugins

- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Packer](https://github.com/wbthomason/packer.nvim)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Surround](https://github.com/blackCauldron7/surround.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
<!-- - [GitHub Theme](https://github.com/projekt0n/github-nvim-theme) -->
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [coc](https://github.com/neoclide/coc.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [vim-commentary](https://github.com/tpope/vim-commentary/)

## Prerequisites

- [Neovim 0.5 or above](https://neovim.io)
- [Node.js](https://nodejs.org)

## Bindings

**\<leader\>** = "\<Space/\>"

| Plugin    | Mapping      | Action                         |
| --------- | ------------ | ------------------------------ |
|           | \<C-H\>      | Move one split left            |
|           | \<C-J\>      | Move one split down            |
|           | \<C-K\>      | Move one split up              |
|           | \<C-L\>      | Move one split right           |
|           | \<C-N\>      | Open file explorer             |
|           | \<C-S\>      | Open search & replace          |
|           | \<leader-t\> | Open a terminal buffer         |
|           | sp           | Split window horizontally      |
|           | tj           | Move one tab left              |
|           | tk           | Move one tab right             |
|           | tn           | Create a new tab               |
|           | to           | Close all other tabs           |
|           | vs           | Split window vertically        |
| coc       | K            | Hover over symbol              |
| coc       | \<C-Space\>  | Open autocompletion            |
| coc       | \<CR\>       | Select autocompletion          |
| coc       | \<S-TAB\>    | Browse previous autocompletion |
| coc       | \<TAB\>      | Browse next autocompletion     |
| coc       | \<leader\>.  | Open code actions              |
| coc       | \<leader\>f  | Format file with prettier      |
| coc       | \<leader\>l  | Execute code autofix           |
| coc       | \<leader\>rn | Rename symbol                  |
| coc       | gd           | Go to definition               |
| Telescope | \<C-B\>      | Open buffer picker             |
| Telescope | \<C-F\>      | Open project search            |
| Telescope | \<C-P\>      | Open file picker               |