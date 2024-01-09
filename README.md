# quick.nvim

A very fast Lua based Neovim configuration that uses native LSP for intellisense

- [What is this?](#what-is-this)
- [Plugins](#plugins)
- [Prerequisites](#prerequisites)
- [Setup](#setup-quicknvim)
  - [Download configuration](#1-download-configuration)
    - [Releases](#releases)
  - [Install plugins](#2-install-plugins)
- [Maintainers](#maintainers)

## What is this?

This is a configuration for Neovim. It's written in Lua, and uses modern plugins like Treesitter & Telescope. It also implements the native Neovim LSP. It's very fast, good looking, and has a lot of nice features.

![quick-nvim-min](https://github.com/albingroen/quick.nvim/assets/19674362/3721f3a0-7198-4e23-9d76-a907dadb91ff)

## Plugins

- [vim-sleuth](https://github.com/tpope/vim-sleuth)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
- [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [rasmus.nvim](https://github.com/kvrohit/rasmus.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## Prerequisites

- [Neovim 0.9 or above](https://neovim.io)

## Setup quick.nvim

### 1. Download configuration

#### Clone repository

If you want to receive updates as this configuration gets patched, then clone this repository into your `.config` directory, or wherever you keep your current Neovim configuration.

```sh
git clone git@github.com:albingroen/quick.nvim.git ~/.config/nvim
```

#### Releases

On the other hand, if you want a raw folder with the configuration files, without git connected to it, you can head over to the releases page, and download a release from there.

https://github.com/albingroen/quick.nvim/releases

### 2. Install plugins

To install the plugins used by quick.nvim, you need to do so using Lazy.

```
nvim ~/.config/nvim/init.lua
```

```
:Lazy sync
```

### Install ripgrep

In order for the Telescope live_grep functionality to work, you need to have ripgrep installed on your machine. Please reference the official ripgrep installation options, but if run Homebrew, you can install it like this.

### Install LSP servers, formatters and linters

You can install anything you want by running `:Mason`. Here are a few that I usually install.

- emmet-language-server emmet_language_server
- eslint-lsp eslint
- stylua
- typescript-language-server tsserver

```
brew install rg
```

## Maintainers

<a href="https://github.com/albingroen"> 
  <img src="https://avatars.githubusercontent.com/u/19674362?v=4" width="80" height="80" />
</a>
