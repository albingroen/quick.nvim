<img width="996" height="662" alt="quick nvim min" src="https://github.com/user-attachments/assets/ad2ec55f-dd0a-4c0f-8086-4de7d1f5ba00" />

# quick.nvim

A very fast Lua based Neovim configuration that uses native LSP for
intellisense.

Launch time: ~60ms

- [What is this?](#what-is-this)
- [Key Features](#key-features)
- [Plugins](#plugins)
- [Prerequisites](#prerequisites)
- [Setup](#setup-quicknvim)
  - [Download configuration](#1-download-configuration)
    - [Releases](#releases)
  - [Install plugins](#2-install-plugins)
  - [Install LSP servers, formatters and linters](#install-lsp-servers-formatters-and-linters)
- [Key Mappings](#key-mappings)
- [Maintainers](#maintainers)

## What is this?

This is a configuration for Neovim. It's written in Lua, and uses modern
plugins like Treesitter, Telescope, and Blink for completion. It uses the native 
Neovim LSP with Mason for managing language servers. It's very fast, minimal, 
and focused on essential features for productive coding.

## Key Features

- **Fast Completion**: Uses Blink.cmp with Rust-based fuzzy matching for blazing fast completions
- **LSP Integration**: Native Neovim LSP with Mason for easy language server management
- **Smart Formatting**: Auto-format on save with Conform.nvim supporting multiple formatters
- **Git Integration**: Gitsigns for inline git blame, diff viewing, and hunk management
- **Fuzzy Finding**: Telescope with Ivy theme for finding files, grepping, and more
- **Smart Editing**: Auto-pairs, auto-tags, context-aware commenting, and surround operations
- **File Navigation**: Oil.nvim for buffer-like file exploration
- **TypeScript Enhanced**: Dedicated TypeScript tools with auto-import support
- **Minimal UI**: Clean interface with Which-key for discoverable keybindings

## Plugins

- [blink.cmp](https://github.com/saghen/blink.cmp) - Fast completion plugin with LSP support
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter plugin
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippet collection
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason integration for LSP
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Package manager for LSP servers, formatters, and linters
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close brackets and quotes
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-surround](https://github.com/kylechui/nvim-surround) - Manipulate surrounding characters
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting and parsing
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto-close HTML/JSX tags
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Context-aware commenting
- [oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utility library
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) - Enhanced TypeScript support
- [vim-rhubarb](https://github.com/tpope/vim-rhubarb) - GitHub integration for fugitive
- [vim-sleuth](https://github.com/tpope/vim-sleuth) - Auto-detect indentation
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding popup

## Prerequisites

- [Neovim 0.9 or above](https://neovim.io)
- [Git](https://git-scm.com/) for version control features
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope live grep
- [Node.js](https://nodejs.org/) for many LSP servers and formatters
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)

### Recommended terminal setup

[Ghostty](https://ghostty.org/) - A fast, feature-rich, and cross-platform terminal emulator

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

### 3. Install LSP servers, formatters and linters

You can install language servers, formatters, and linters by running `:Mason`. 
Here are the recommended installations:

#### Language Servers

These are the language servers I use. Obviously, feel free to install whichever
ones you want.

- lua-language-server (lua_ls)
- pyright (Python)
- eslint-lsp (eslint)
- stylelint-lsp (stylelint_lsp)
- tailwindcss-language-server (tailwindcss)

#### Formatters
- prettierd (JavaScript/TypeScript/HTML/CSS/JSON)
- stylua (Lua)

Note: The configuration uses `typescript-tools.nvim` for TypeScript/JavaScript language 
server support with enhanced features like auto-import, so you don't need to install 
typescript-language-server separately.

## Key Mappings

Leader key is set to `Space`.

### General
- `<Space>?` - Show buffer-local keymaps (which-key)
- `<C-S>` - Start search and replace
- `<C-h/j/k/l>` - Navigate between splits

### File Navigation
- `-` - Open Oil file explorer (parent directory)
- `<Space>f` - Find files (Telescope)
- `<Space>s` - Live grep (search text in files)
- `<Space>w` - Grep word under cursor
- `<Space>b` - Show buffers
- `<Space>c` - Resume last Telescope search
- `<Space>z` - Fuzzy find in current buffer

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `<Space>rn` - Rename symbol
- `<Space>.` - Code actions
- `<Space>i` - Add missing imports (TypeScript)
- `<Space>e` - Show diagnostics for current line
- `<Space>d` - Show all diagnostics

### Git (Gitsigns)
- `]c` / `[c` - Next/previous hunk
- `<Space>hs` - Stage hunk
- `<Space>hr` - Reset hunk
- `<Space>hS` - Stage buffer
- `<Space>hR` - Reset buffer
- `<Space>hp` - Preview hunk
- `<Space>hb` - Blame line
- `<Space>hd` - Diff this
- `<Space>tb` - Toggle line blame
- `<Space>gb` - Git branches (Telescope)
- `<Space>gc` - Git commits (Telescope)

### Tabs and Windows
- `tn` - New tab
- `tk` / `tj` - Next/previous tab
- `to` - Close other tabs
- `sp` - Horizontal split
- `vs` - Vertical split
- `<Space>o` - Close all other tabs and windows

### Quickfix
- `<Space>j` - Next quickfix item
- `<Space>k` - Previous quickfix item

## Maintainers

<a href="https://github.com/albingroen"> <img
  src="https://avatars.githubusercontent.com/u/19674362?v=4" width="80"
  height="80" /> </a>

## Contributors



<a href="[https://github.com/albingroen](https://github.com/Signynt)"> <img
  src="https://avatars.githubusercontent.com/u/67801159?v=4" width="60"
  height="60" /> </a>
