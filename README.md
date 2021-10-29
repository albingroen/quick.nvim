# quick.nvim

A very fast Lua based Neovim configuration that uses coc.nvim for intellisense

## What is this?

This is my configuration for Neovim. It's mostly written in Lua, and uses
modern plugins like Treesitter, Telescope, and Lualine. It does however not
implement the native Neovim LSP, since I don't think it's good enough yet for
Svelte development. It's very fast, good looking, and has a lot of nice
features.

![screenshot](https://user-images.githubusercontent.com/19674362/139430752-07861315-9610-47c8-8ffc-a48dcab44a95.png)

## Plugins

- [Packer](https://github.com/wbthomason/packer.nvim)
- [coc](https://github.com/neoclide/coc.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [git-worktree](https://github.com/ThePrimeagen/git-worktree.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Surround](https://github.com/blackCauldron7/surround.nvim)

## Setup quick.nvim

If you want to receive updates as this configuration gets patched, then clone
this repository into your `.config` directory, or wherever you keep your
current Neovim configuration.

```sh
git clone git@github.com:albingroen/quick.nvim.git ~/.config/nvim
```

On the other hand, if you want a raw folder with the configuration files,
without git connected to it, you can head over to the releases page, and
download a release from there.

### [\> Releases \<](https://github.com/albingroen/quick.nvim/releases)

## Bindings

**\<leader\>** = "\<Space/\>"

| Plugin    | Mapping       | Action                         |
| --------- | ------------- | ------------------------------ |
| Telescope | \<C-P\>       | Open file picker               |
| Telescope | \<C-F\>       | Open project search            |
| Telescope | \<C-B\>       | Open buffer picker             |
| Telescope | \<C-T\>       | Open Git worktree picker       |
| COC       | \<leader\>.   | Open code actions              |
| COC       | \<leader\>l   | Execute code autofix           |
| COC       | gd            | Go to definition               |
| COC       | K             | Hover over symbol              |
| COC       | \<leader\>rn | Rename symbol                  |
| COC       | \<leader\>f   | Format file with prettier      |
| COC       | \<C-Space\>   | Open autocompletion            |
| COC       | \<TAB\>       | Browse next autocompletion     |
| COC       | \<S-TAB\>     | Browse previous autocompletion |
| COC       | \<CR\>        | Select autocompletion          |
|           | vs            | Split window vertically        |
|           | sp            | Split window horizontally      |
|           | \<C-H\>       | Move one split to left         |
|           | \<C-J\>       | Move one split to below        |
|           | \<C-K\>       | Move one split up              |
|           | \<C-L\>       | Move one split right           |
|           | tn            | Create a new tab               |
|           | tk            | Move one tab to the right      |
|           | tj            | Move one tab to the left       |
|           | to            | Close all other tabs           |
|           | \<C-S\>       | Open search & replace          |
|           | \<C-N\>       | Open file explorer             |
