# LazyVim Config for Python AI Development

My personal Neovim configuration based on LazyVim, optimized for Python AI agent development.

## ⚡ Quick Start

**Before installing, you MUST have:**
1. Neovim >= 0.9.0
2. Git
3. A [Nerd Font](https://www.nerdfonts.com/) installed and set in your terminal
4. `ripgrep` and `fd` (or `fd-find` on Ubuntu/Debian)

**See [Prerequisites](#prerequisites) below for detailed installation commands.**

## Features

- 🐍 **Python LSP** with Pyright for type checking and completions
- ⚡ **Ruff** for fast linting and formatting
- 🐛 **Debugpy** for Python debugging
- 🔄 **Virtual environment detection** - automatically detects venv/.venv
- 💾 **Auto-save** on file changes
- 🖥️ **Persistent terminals** with ToggleTerm
- 🎨 **Gruvbox** colorscheme
- 📄 **PDF viewer integration** with Zathura
- 🔧 **Quality of life** improvements for coding

## Prerequisites

### Required
- **Neovim** >= 0.9.0
- **Git**
- **A Nerd Font** (for icons) - Install from [nerdfonts.com](https://www.nerdfonts.com/)
- **ripgrep** (for telescope searching)
- **fd** or **fd-find** (for file finding)

### System-Specific Prerequisites

#### Ubuntu/Debian
```bash
# Install Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Install dependencies
sudo apt install git ripgrep fd-find python3-venv

# Fix fd vs fdfind naming issue
sudo rm /usr/bin/fd 2>/dev/null
sudo ln -s /usr/bin/fdfind /usr/bin/fd

# Optional: Install Zathura for PDF viewing
sudo apt install zathura
```

#### macOS
```bash
# Install Neovim
brew install neovim

# Install dependencies
brew install git ripgrep fd

# Optional: Install Zathura for PDF viewing
brew install zathura
```

### Python (Required for Python Development)
- **Python 3.8+** with `python3-venv` package

### Python Development Tools (auto-installed via Mason)
The following will be installed automatically when you first open Neovim:
- `pyright` - Python LSP server
- `ruff` - Python linter/formatter
- `debugpy` - Python debugger

**Note:** These Python tools are installed by Mason inside Neovim, but you need Python itself installed on your system first.

## Installation

### Fresh Install

1. **Backup existing config** (if you have one):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
```

2. **Clone this repository**:
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/.config/nvim
```

3. **Launch Neovim**:
```bash
nvim
```

On first launch, Lazy will automatically:
- Install all plugins
- Download LSP servers, linters, and formatters
- Set up the environment

4. **Wait for installation to complete**, then restart Neovim.

### Updating

To update plugins:
```bash
nvim
```
Then press `<Space>l` to open Lazy, then press `U` to update all plugins.

## Post-Installation

### Known Issues & Fixes

#### blink.cmp `string.buffer` error
If you see an error about `string.buffer` module not found:

**Option 1: Wait for it to be fixed upstream** (recommended)
```vim
:Lazy update blink.cmp
```

**Option 2: Disable fuzzy matching**
Create `~/.config/nvim/lua/plugins/blink.lua`:
```lua
return {
  {
    "saghen/blink.cmp",
    opts = {
      fuzzy = { enable = false },
    },
  },
}
```

#### fd command not found (Ubuntu/Debian only)
```bash
sudo ln -s /usr/bin/fdfind /usr/bin/fd
```

## File Structure

```
~/.config/nvim/
├── init.lua                      # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua          # Auto commands (markdown diagnostics disabled)
│   │   ├── keymaps.lua           # Custom keymaps
│   │   ├── lazy.lua              # Lazy.nvim plugin manager setup
│   │   └── options.lua           # Neovim options
│   └── plugins/
│       ├── colorscheme.lua       # Gruvbox theme
│       ├── completion.lua        # Completion settings (currently empty, using blink.cmp default)
│       ├── pdfview.lua           # PDF viewer integration (<Space>p)
│       ├── python.lua            # Python LSP, Ruff, debugpy, venv selector
│       ├── qol.lua               # Auto-save & ToggleTerm
│       └── telescope.lua         # Telescope file finder config
└── README.md                     # This file
```

## Key Bindings

See [nvim-keybinds.md](./nvim-keybinds.md) for a comprehensive cheat sheet.

### Most Important

| Key | Action |
|-----|--------|
| `<Space><Space>` | Find files |
| `<Space>/` | Search in project |
| `<Space>e` | Toggle file explorer |
| `<Ctrl-\>` | Toggle terminal |
| `<Ctrl-s>` | Save file |
| `gd` | Go to definition |
| `gr` | Find references |
| `<Space>ca` | Code actions |
| `<Space>cf` | Format file |
| `<Space>cv` | Select Python venv |

## Customization

### Add your own plugins

Create a new file in `~/.config/nvim/lua/plugins/`:

```lua
-- ~/.config/nvim/lua/plugins/my-plugin.lua
return {
  {
    "username/plugin-name",
    opts = {
      -- plugin options
    },
  },
}
```

### Modify existing settings

Edit files in `~/.config/nvim/lua/config/` or override plugin configs in `~/.config/nvim/lua/plugins/`.

## Dependencies Explained

### Core Dependencies
- **lazy.nvim** - Plugin manager (auto-installed)
- **LazyVim** - Neovim starter config (base layer)

### File Navigation
- **telescope.nvim** - Fuzzy finder
- **ripgrep** - Fast text search
- **fd/fd-find** - Fast file finder

### Python Development
- **nvim-lspconfig** - LSP client
- **mason.nvim** - LSP/tool installer
- **pyright** - Python type checker
- **ruff** - Python linter/formatter
- **debugpy** - Python debugger
- **nvim-dap** - Debug Adapter Protocol
- **nvim-dap-python** - Python debugging integration
- **venv-selector.nvim** - Virtual environment picker

### UI/UX
- **gruvbox.nvim** - Color scheme
- **auto-save.nvim** - Auto-save files
- **toggleterm.nvim** - Better terminal integration
- **nvim-cmp** or **blink.cmp** - Autocompletion

### Optional
- **zathura** - PDF viewer (for `<Space>p` keybind)

## Usage Tips

### Python Development Workflow

1. Open project: `cd your-project && nvim`
2. Select venv: `<Space>cv`
3. Find files: `<Space><Space>`
4. Open terminal: `<Ctrl-\>`
5. Format code: `<Space>cf`

### Using with Claude Code CLI

1. Open terminal in split: `<Space>th`
2. Run Claude Code CLI in the terminal
3. Edit files in Neovim
4. Switch between terminal and editor with `<Ctrl-h/j/k/l>`

## Troubleshooting

### Plugins not loading
```vim
:Lazy sync
```

### LSP not working
```vim
:Mason
```
Then install `pyright` and `ruff` manually.

### Performance issues
```vim
:Lazy profile
```

### Reset everything
```bash
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
nvim
```

## Credits

- [LazyVim](https://www.lazyvim.org/) - Starter configuration
- [Neovim](https://neovim.io/) - The editor
- All plugin authors (see `:Lazy`)

## License

MIT
