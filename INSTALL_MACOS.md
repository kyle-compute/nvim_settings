# macOS Installation Guide

Complete guide to installing this Neovim configuration on macOS.

## Prerequisites

### 1. Install Homebrew (if not already installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Core Dependencies

```bash
# Essential tools
brew install neovim git ripgrep fd python3 node

# Verify installations
nvim --version  # Should be >= 0.9.0
git --version
rg --version
fd --version
python3 --version
node --version
```

### 3. Install Build Tools

#### Xcode Command Line Tools (Required)

```bash
xcode-select --install
```

This is required for `nvim-treesitter` to compile syntax parsers.

#### Rust Toolchain (Recommended)

```bash
# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add to current shell
source ~/.cargo/env

# Install nightly (required for blink.cmp optimal performance)
rustup default nightly

# Verify installation
rustc --version
cargo --version
```

**Why Rust?** The `blink.cmp` completion plugin uses a Rust-based fuzzy matcher that's 6x faster than alternatives. While it can download prebuilt binaries, building from source gives best performance.

### 4. Install a Nerd Font (Required)

```bash
# Install JetBrains Mono Nerd Font (or choose another)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Other popular options:
# brew install --cask font-hack-nerd-font
# brew install --cask font-fira-code-nerd-font
# brew install --cask font-meslo-lg-nerd-font
```

**Configure your terminal:**
- **iTerm2:** Preferences → Profiles → Text → Font → Select "JetBrainsMono Nerd Font"
- **Terminal.app:** Preferences → Profiles → Text → Font → Change → Select "JetBrainsMono Nerd Font"
- **Alacritty:** Edit `~/.config/alacritty/alacritty.yml`:
  ```yaml
  font:
    normal:
      family: "JetBrainsMono Nerd Font"
  ```

### 5. Optional: PDF Viewer

```bash
# Option 1: Install Zathura
brew install zathura

# Option 2: Use macOS Preview (built-in)
# You'll need to modify the pdfview.lua config to use 'open' command instead
```

## Installation

### 1. Backup Existing Config (if any)

```bash
# Backup your current nvim config
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone This Repository

```bash
# Replace YOUR_USERNAME and YOUR_REPO with your actual GitHub info
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/.config/nvim
cd ~/.config/nvim
```

### 3. macOS-Specific Configuration Adjustments

If you're not using Zathura, modify the PDF viewer configuration:

```bash
# Edit the PDF viewer config
nvim ~/.config/nvim/lua/plugins/pdfview.lua
```

Change from:
```lua
vim.fn.jobstart({ "zathura", "--fork", file }, { detach = true })
```

To (for macOS Preview):
```lua
vim.fn.jobstart({ "open", file }, { detach = true })
```

Also update the telescope config to use `fd` instead of `fdfind`:

```bash
# Edit telescope config
nvim ~/.config/nvim/lua/plugins/telescope.lua
```

Change line 19 from:
```lua
find_command = { "fdfind", "--type", "f", "--type", "l", "--color", "never" },
```

To:
```lua
find_command = { "fd", "--type", "f", "--type", "l", "--color", "never" },
```

### 4. Launch Neovim

```bash
nvim
```

On first launch, Lazy.nvim will automatically:
- Install all plugins (~50 plugins)
- Download LSP servers, linters, and formatters via Mason
- Compile treesitter parsers
- Build blink.cmp from source (if Rust is installed)

**This may take 2-5 minutes.** You'll see progress in the Lazy window.

### 5. Wait for Installation to Complete

Watch for:
- Lazy.nvim installing plugins
- Mason installing language servers
- Treesitter compiling parsers
- Any error messages (see Troubleshooting below)

Once complete, close and reopen Neovim:

```bash
# Quit nvim
:qa

# Relaunch
nvim
```

## Verification

### Check Plugin Status

```vim
:Lazy
```

All plugins should show green checkmarks.

### Check Mason Installations

```vim
:Mason
```

You should see installed:
- pyright, ruff, debugpy (Python)
- typescript-language-server, prettier, eslint-lsp, tailwindcss-language-server (JS/TS)
- sqlls, sql-formatter (SQL)

### Check Treesitter

```vim
:TSInstallInfo
```

Should show multiple parsers installed and compiled.

### Test Basic Functionality

1. Open a Python file: `nvim test.py`
2. Type `def hello():` - should see completions
3. Press `<Space><Space>` - should open file finder
4. Press `<Ctrl-\>` - should open terminal

## Troubleshooting

### Issue: `string.buffer` error with blink.cmp

**Solution 1:** Update blink.cmp
```vim
:Lazy update blink.cmp
```

**Solution 2:** Rebuild from source
```bash
cd ~/.local/share/nvim/lazy/blink.cmp
cargo build --release
```

**Solution 3:** Disable fuzzy matching (fallback)
Create `~/.config/nvim/lua/plugins/blink-fix.lua`:
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

### Issue: Treesitter parsers fail to compile

**Cause:** Missing C compiler

**Solution:**
```bash
# Reinstall Xcode Command Line Tools
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```

### Issue: Icons not showing (squares/boxes instead)

**Cause:** Nerd Font not configured

**Solution:**
1. Verify font is installed: `ls ~/Library/Fonts/ | grep -i nerd`
2. Configure your terminal to use the Nerd Font
3. Restart your terminal
4. Restart Neovim

### Issue: Mason fails to install tools

**Solution:**
```vim
:MasonUpdate
:Mason
```

Then manually install failed tools by pressing `i` on them.

### Issue: Python LSP not working

**Solution:**
```bash
# Ensure Python 3 is installed
python3 --version

# Manually install pyright via Mason
nvim
:MasonInstall pyright ruff debugpy
```

### Issue: Rust compilation fails

**Solution:**
```bash
# Ensure nightly toolchain is installed
rustup default nightly
rustup update

# Rebuild blink.cmp
cd ~/.local/share/nvim/lazy/blink.cmp
cargo clean
cargo build --release
```

### Issue: Performance issues

**Check startup time:**
```bash
nvim --startuptime startup.log
cat startup.log
```

**Profile plugins:**
```vim
:Lazy profile
```

### Complete Reset

If all else fails, start fresh:

```bash
# Remove all nvim data
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Relaunch nvim
nvim
```

## Post-Installation

### Learn the Keybindings

See [nvim-keybinds.md](./nvim-keybinds.md) for a complete reference.

**Essential keybinds:**
- `<Space><Space>` - Find files
- `<Space>/` - Search in project
- `<Space>e` - Toggle file explorer
- `<Ctrl-\>` - Toggle terminal
- `<Space>cv` - Select Python virtual environment

### Customize Your Config

Add your own plugins in `~/.config/nvim/lua/plugins/`:

```lua
-- ~/.config/nvim/lua/plugins/my-custom.lua
return {
  {
    "username/plugin-name",
    opts = {
      -- your options
    },
  },
}
```

### Update Plugins Regularly

```vim
:Lazy update
```

### Keep Mason Tools Updated

```vim
:MasonUpdate
```

## Common Workflows

### Python Development

```bash
# 1. Navigate to your project
cd ~/my-python-project

# 2. Open in nvim
nvim

# 3. Select virtual environment
# Press: <Space>cv

# 4. Start coding!
```

### JavaScript/TypeScript Development

```bash
# 1. Open project
cd ~/my-next-app
nvim

# 2. Format on save is automatic
# 3. Use <Space>cf to manually format
```

### Database Work

```bash
# 1. Open nvim
nvim

# 2. Press <Space>db to open Database UI
# 3. Add connection (PostgreSQL, MySQL, SQLite, etc.)
```

## Additional Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Main README](./README.md)
- [Keybindings Cheat Sheet](./nvim-keybinds.md)

## Support

If you encounter issues:

1. Check this guide's Troubleshooting section
2. Check `:checkhealth` in Neovim
3. Check plugin documentation: `:Lazy`
4. Review logs: `~/.local/state/nvim/lazy.log`

## Summary Command List

```bash
# Quick installation (after Homebrew is installed)
brew install neovim git ripgrep fd python3 node
xcode-select --install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup default nightly
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Clone config
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/.config/nvim

# Launch and wait for installation
nvim
```

Enjoy your fully-configured Neovim setup!
