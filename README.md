# quick.nvim

A very fast Lua based Neovim configuration that uses native LSP for
intellisense

- [What is this?](#what-is-this)
- [Plugins](#plugins)
- [Prerequisites](#prerequisites)
- [Setup](#setup-quicknvim)
  - [Download configuration](#1-download-configuration)
    - [Releases](#releases)
  - [Install plugins](#2-install-plugins)
- [Maintainers](#maintainers)

## What is this?

This is a configuration for Neovim. It's written in Lua, and uses modern
plugins like Treesitter & Telescope. It also implements the native Neovim LSP.
It's very fast, good looking, and has a lot of nice features.

## Plugins

- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [gp.nvim](https://github.com/Robitx/gp.nvim?tab=readme-ov-file#4-configuration)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
- [vim-sleuth](https://github.com/tpope/vim-sleuth)
- [zenbones](https://github.com/mcchrish/zenbones.nvim)

## Prerequisites


- [Neovim 0.9 or above](https://neovim.io)

### Recommended terminal setup

[Kitty](https://sw.kovidgoyal.net/kitty/conf/) with the [following
configuration](https://github.com/albingroen/dotfiles/tree/main/kitty)

## Setup quick.nvim

### 1. Download configuration

#### Clone repository

If you want to receive updates as this configuration gets patched, then clone
this repository into your `.config` directory, or wherever you keep your
current Neovim configuration.

    git clone https://github.com/albingroen/quick.nvim.git

#### Releases

On the other hand, if you want a raw folder with the configuration files,
without git connected to it, you can head over to the releases page, and
download a release from there.

https://github.com/albingroen/quick.nvim/releases

### 2. Install plugins

To install the plugins used by quick.nvim, you need to do so using Lazy.

    nvim ~/.config/nvim/init.lua

    :Lazy sync

### Install ripgrep

In order for the Telescope live_grep functionality to work, you need to have
ripgrep installed on your machine. Please reference the official ripgrep
installation options, but if run Homebrew, you can install it like this.

    brew install rg

### Install LSP servers, formatters and linters

You can install anything you want by running `:Mason`. Here are a few that I
usually install.

- emmet-language-server emmet_language_server
- eslint-lsp eslint
- stylua
- typescript-language-server tsserver

## Maintainers

<a href="https://github.com/albingroen"> <img
  src="https://avatars.githubusercontent.com/u/19674362?v=4" width="80"
  height="80" /> </a>
