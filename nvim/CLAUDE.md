# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on NvChad v2.5 with custom plugins and settings. The configuration is written in Lua and uses lazy.nvim for plugin management.

## Architecture

### Core Structure

- **init.lua**: Entry point that bootstraps lazy.nvim, loads NvChad base, and initializes plugins, options, and mappings
- **lua/chadrc.lua**: NvChad configuration (theme, UI settings, plugin overrides)
- **lua/options.lua**: Custom Vim options and autocommands
- **lua/mappings.lua**: Custom keybindings
- **lua/plugins/init.lua**: Plugin declarations with lazy-loading configuration
- **lua/configs/**: Individual plugin configurations

### Plugin System

Plugins are declared in `lua/plugins/init.lua` using lazy.nvim format. Each plugin typically has:
- A corresponding config file in `lua/configs/` for setup
- Lazy-loading configuration (events: `BufReadPre`, `BufNewFile`, `VeryLazy`)
- Dependencies declared explicitly

### LSP Architecture

LSP configuration uses a layered approach:

1. **lspconfig.servers** (lua/configs/lspconfig.lua:8-12): Define list of available servers
2. **mason-lspconfig** (lua/configs/mason-lspconfig.lua): Auto-installation of servers from the list
3. **lspconfig setup**: Each server configured with NvChad's on_attach, on_init, capabilities

Configured servers:
- **lua_ls**: Diagnostics disabled, workspace configured for Neovim and Love2D
- **pyright**: Type checking disabled
- **nil_ls**: Nix language server with alejandra formatting

### Formatting & Linting

Formatting uses **conform.nvim** with format-on-save enabled:
- Formatters: stylua (Lua), black (Python), alejandra (Nix)
- Configuration: lua/configs/conform.lua
- Auto-install: lua/configs/mason-conform.lua (currently ignores alejandra, black, stylua)

Linting uses **nvim-lint**:
- Linters: luacheck (Lua), mypy/ruff/flake8 (Python)
- Triggers: BufEnter, BufWritePost, InsertLeave
- Auto-install: lua/configs/mason-lint.lua

### LaTeX Support

VimTeX plugin configured for LaTeX editing:
- PDF viewer: Zathura
- Compiler: latexmk with PDF output, synctex enabled
- Keybindings: `<leader>cc` (compile), `<leader>cv` (view), `<leader>cq` (stop), `<leader>ct` (TOC)
- Configuration: lua/configs/vimtex.lua

## Key Behaviors

### Working Directory Management

The configuration includes a VimEnter autocmd (lua/options.lua:17-27) that changes to a directory path if one is provided as an argument when launching Neovim.

### Telescope Configuration

Telescope is overridden in chadrc.lua to prevent automatic directory changing and to use the current working directory for find_files.

### Format on Save

Enabled by default with 500ms timeout and LSP fallback (lua/configs/conform.lua:25-29).

## Development Commands

### Testing Configuration Changes

After modifying config files:
```bash
nvim  # Simply relaunch Neovim to test changes
```

For plugin changes, use lazy.nvim commands within Neovim:
- `:Lazy sync` - Update and sync plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy restore` - Restore plugins from lazy-lock.json

### Formatting Configuration

To test stylua formatting:
```bash
stylua --check .  # Check formatting
stylua .          # Format all Lua files
```

### Adding New LSP Servers

1. Add server name to `lspconfig.servers` in lua/configs/lspconfig.lua:8-12
2. Configure server setup in the same file (see lua_ls, pyright, nil_ls examples)
3. Optionally adjust mason-lspconfig.lua to enable auto-installation

### Adding New Formatters/Linters

1. Add to formatters_by_ft in lua/configs/conform.lua or linters_by_ft in lua/configs/lint.lua
2. Add formatter-specific args if needed
3. Adjust ignore_install lists in mason-conform.lua or mason-lint.lua if using system packages

## Plugin Management

Commented-out plugins (ready to enable):
- DAP (Debug Adapter Protocol) with Python support and UI
- Iron.nvim (REPL integration)
- LuaSnip custom snippets
- jupytext.nvim (Jupyter notebook support)

These are in lua/plugins/init.lua and have corresponding config files in lua/configs/.
