# Linux Installation Guide

Complete guide to installing this Neovim configuration on Linux.

## Prerequisites

### 1. Install Core Dependencies

#### Ubuntu/Debian

```bash
# Add Neovim PPA for latest version
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# Install essential tools
sudo apt install neovim git ripgrep fd-find python3 python3-venv python3-pip nodejs npm

# Fix fd vs fdfind naming issue (Ubuntu/Debian specific)
sudo rm /usr/bin/fd 2>/dev/null
sudo ln -s /usr/bin/fdfind /usr/bin/fd

# Verify installations
nvim --version  # Should be >= 0.9.0
git --version
rg --version
fd --version
python3 --version
node --version
```

#### Fedora

```bash
# Install essential tools
sudo dnf install neovim git ripgrep fd-find python3 python3-pip nodejs npm

# Verify installations
nvim --version
git --version
rg --version
fd --version
python3 --version
node --version
```

#### Arch Linux

```bash
# Install essential tools
sudo pacman -S neovim git ripgrep fd python python-pip nodejs npm

# Verify installations
nvim --version
git --version
rg --version
fd --version
python --version
node --version
```

### 2. Install Build Tools

#### Ubuntu/Debian

```bash
# Install build essentials (required for nvim-treesitter)
sudo apt install build-essential

# Verify gcc is installed
gcc --version
```

#### Fedora

```bash
# Install development tools
sudo dnf groupinstall "Development Tools"
sudo dnf install gcc-c++

# Verify gcc is installed
gcc --version
```

#### Arch Linux

```bash
# Install base development tools
sudo pacman -S base-devel

# Verify gcc is installed
gcc --version
```

### 3. Install Rust Toolchain (Recommended)

```bash
# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add to current shell
source "$HOME/.cargo/env"

# Install nightly (required for blink.cmp optimal performance)
rustup default nightly

# Verify installation
rustc --version
cargo --version
```

**Why Rust?** The `blink.cmp` completion plugin uses a Rust-based fuzzy matcher that's 6x faster than alternatives. While it can download prebuilt binaries, building from source gives best performance.

### 4. Install a Nerd Font (Required)

#### Method 1: Manual Installation (All Distros)

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download JetBrains Mono Nerd Font
cd ~/.local/share/fonts
curl -fLo "JetBrains Mono Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

# Refresh font cache
fc-cache -fv

# Verify installation
fc-list | grep -i "jetbrains"
```

#### Method 2: Package Manager

**Ubuntu/Debian:**
```bash
# Download and install from GitHub releases
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
rm JetBrainsMono.zip
```

**Arch Linux:**
```bash
# Install from AUR
yay -S nerd-fonts-jetbrains-mono
# OR
paru -S nerd-fonts-jetbrains-mono
```

**Configure your terminal:**
- **GNOME Terminal:** Preferences → Profile → Text → Font → Select "JetBrainsMono Nerd Font"
- **Konsole:** Settings → Edit Current Profile → Appearance → Font → Select "JetBrainsMono Nerd Font"
- **Alacritty:** Edit `~/.config/alacritty/alacritty.yml`:
  ```yaml
  font:
    normal:
      family: "JetBrainsMono Nerd Font"
  ```
- **Kitty:** Edit `~/.config/kitty/kitty.conf`:
  ```
  font_family JetBrainsMono Nerd Font
  ```

### 5. Optional: PDF Viewer

#### Ubuntu/Debian

```bash
sudo apt install zathura
```

#### Fedora

```bash
sudo dnf install zathura zathura-pdf-mupdf
```

#### Arch Linux

```bash
sudo pacman -S zathura zathura-pdf-mupdf
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

### 3. Launch Neovim

```bash
nvim
```

On first launch, Lazy.nvim will automatically:
- Install all plugins (~50 plugins)
- Download LSP servers, linters, and formatters via Mason
- Compile treesitter parsers
- Build blink.cmp from source (if Rust is installed)

**This may take 2-5 minutes.** You'll see progress in the Lazy window.

### 4. Wait for Installation to Complete

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

**Solution (Ubuntu/Debian):**
```bash
sudo apt install build-essential
```

**Solution (Fedora):**
```bash
sudo dnf groupinstall "Development Tools"
```

**Solution (Arch):**
```bash
sudo pacman -S base-devel
```

### Issue: `fd` command not found (Ubuntu/Debian only)

**Cause:** Ubuntu/Debian names the binary `fdfind`

**Solution:**
```bash
sudo ln -s /usr/bin/fdfind /usr/bin/fd
# OR without sudo:
mkdir -p ~/.local/bin
ln -s /usr/bin/fdfind ~/.local/bin/fd
# Then add ~/.local/bin to your PATH in ~/.bashrc or ~/.zshrc
```

### Issue: Icons not showing (squares/boxes instead)

**Cause:** Nerd Font not configured

**Solution:**
```bash
# Verify font is installed
fc-list | grep -i "nerd"

# If not found, reinstall
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrains Mono Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
fc-cache -fv
```

Then configure your terminal emulator to use the font and restart.

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
# Ensure Python 3 and venv are installed
sudo apt install python3 python3-venv python3-pip  # Ubuntu/Debian
# OR
sudo dnf install python3 python3-pip  # Fedora
# OR
sudo pacman -S python python-pip  # Arch

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

### Issue: Permission denied errors

**Solution:**
```bash
# Fix permissions on nvim directories
chmod -R u+rwX ~/.config/nvim
chmod -R u+rwX ~/.local/share/nvim
chmod -R u+rwX ~/.local/state/nvim
chmod -R u+rwX ~/.cache/nvim
```

### Issue: Zathura not opening PDFs

**Solution:**
```bash
# Install Zathura and PDF support
sudo apt install zathura zathura-pdf-poppler  # Ubuntu/Debian
# OR
sudo dnf install zathura zathura-pdf-mupdf  # Fedora
# OR
sudo pacman -S zathura zathura-pdf-mupdf  # Arch

# Test it manually
zathura somefile.pdf
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

# 2. Create/activate virtual environment
python3 -m venv venv
source venv/bin/activate

# 3. Open in nvim
nvim

# 4. Select virtual environment
# Press: <Space>cv

# 5. Start coding!
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

## System-Specific Notes

### WSL (Windows Subsystem for Linux)

If running on WSL, follow the Ubuntu/Debian instructions above, plus:

```bash
# Install wslu for better Windows integration
sudo apt install wslu

# For clipboard integration
sudo apt install xclip
```

### Wayland vs X11

This config works on both Wayland and X11. For clipboard support:

**Wayland:**
```bash
sudo apt install wl-clipboard  # Ubuntu/Debian
```

**X11:**
```bash
sudo apt install xclip  # Ubuntu/Debian
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

## Quick Installation Summary

### Ubuntu/Debian
```bash
# Install dependencies
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim git ripgrep fd-find python3 python3-venv nodejs npm build-essential
sudo ln -s /usr/bin/fdfind /usr/bin/fd

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup default nightly

# Install Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
rm JetBrainsMono.zip

# Clone config
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/.config/nvim

# Launch and wait for installation
nvim
```

### Fedora
```bash
# Install dependencies
sudo dnf install neovim git ripgrep fd-find python3 nodejs npm gcc-c++

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup default nightly

# Install Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
rm JetBrainsMono.zip

# Clone config
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/.config/nvim

# Launch and wait for installation
nvim
```

### Arch Linux
```bash
# Install dependencies
sudo pacman -S neovim git ripgrep fd python nodejs npm base-devel

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup default nightly

# Install Nerd Font (using AUR helper)
yay -S nerd-fonts-jetbrains-mono

# Clone config
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git ~/.config/nvim

# Launch and wait for installation
nvim
```

Enjoy your fully-configured Neovim setup!
