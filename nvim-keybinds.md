# LazyVim Keybindings Cheat Sheet

**Leader Key:** `<Space>`

---

## **🔥 Most Essential - Learn These First**

### File & Project Navigation
- `<Space><Space>` - **Find files** (fuzzy search) - USE THIS ALL THE TIME
- `<Space>/` - **Search text in project** (grep)
- `<Space>e` - **Toggle file explorer**
- `<Space>fr` - Recent files
- `<Ctrl-o>` - Jump back to previous location
- `<Ctrl-i>` - Jump forward

### Save & Quit
- `<Ctrl-s>` - **Save file** (works in normal and insert mode)
- `:w` - Save file
- `:q` - Quit
- `:wq` or `ZZ` - Save and quit
- `:qa` - Quit all windows

### Terminal
- `<Ctrl-\>` - **Toggle terminal** (your Claude Code CLI terminal)
- `<Space>ft` - Terminal at project root
- `<Space>tf` - Floating terminal
- `<Space>th` - Horizontal split terminal
- `<Space>tv` - Vertical split terminal

---

## **💻 Code Intelligence (LSP)**

### Navigation
- `gd` - **Go to definition** - jump to where function/class is defined
- `gr` - **Find all references** - see where something is used
- `K` - **Hover documentation** - see type hints, docstrings
- `gI` - Go to implementation
- `gy` - Go to type definition

### Code Actions & Refactoring
- `<Space>ca` - **Code actions** (auto-fix imports, quick fixes)
- `<Space>cr` - **Rename symbol** (rename variable/function everywhere)
- `<Space>cf` - **Format file** (runs Ruff for Python)
- `<Space>cd` - Show line diagnostics (errors/warnings)

### Diagnostics (Errors & Warnings)
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]e` - Next error
- `[e` - Previous error
- `]w` - Next warning
- `[w` - Previous warning

---

## **📝 Editing & Movement**

### Basic Movement
- `h/j/k/l` - Left/Down/Up/Right (use these instead of arrow keys!)
- `w` - Jump forward one word
- `b` - Jump backward one word
- `0` - Start of line
- `$` - End of line
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `<Ctrl-d>` - Scroll down half page
- `<Ctrl-u>` - Scroll up half page

### Editing Commands
- `i` - Insert mode (before cursor)
- `a` - Insert mode (after cursor)
- `o` - Insert new line below
- `O` - Insert new line above
- `<Esc>` - Exit insert mode, clear search highlighting
- `u` - Undo
- `<Ctrl-r>` - Redo
- `dd` - Delete line
- `yy` - Copy (yank) line
- `p` - Paste after cursor
- `P` - Paste before cursor
- `ciw` - Change inner word
- `ci"` - Change text inside quotes
- `vi{` - Visual select inside braces

### Line Movement
- `<Alt-j>` - Move current line down
- `<Alt-k>` - Move current line up

---

## **🪟 Window & Buffer Management**

### Splits/Windows
- `<Ctrl-h>` - Move to left split
- `<Ctrl-j>` - Move to down split
- `<Ctrl-k>` - Move to up split
- `<Ctrl-l>` - Move to right split
- `:split` or `:sp` - Horizontal split
- `:vsplit` or `:vsp` - Vertical split

### Buffers (Tabs/Files)
- `<Shift-h>` - Previous buffer
- `<Shift-l>` - Next buffer
- `<Space>bd` - **Delete/close current buffer**
- `<Space>bb` - Switch to last buffer
- `<Space>bo` - Close all other buffers
- `[b` - Previous buffer
- `]b` - Next buffer

---

## **🔍 Search & Replace**

- `/pattern` - **Search forward**
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `*` - Search for word under cursor
- `<Space>sr` - Search and replace in project
- `:s/old/new/g` - Replace in current line
- `:%s/old/new/g` - Replace in entire file

---

## **🐍 Python-Specific**

### Virtual Environment
- `<Space>cv` - **Select virtual environment**

### Debugging (DAP)
- `<Space>db` - Toggle breakpoint
- `<Space>dc` - Start/continue debugging
- `<Space>di` - Step into function
- `<Space>do` - Step out of function
- `<Space>dO` - Step over

---

## **🎨 Git Integration**

- `<Space>gg` - Open LazyGit (if installed)
- `<Space>gb` - Git blame current line
- `<Space>gB` - Git browse (open in browser)
- `<Space>gs` - Git status
- `]h` - Next git hunk (change)
- `[h` - Previous git hunk

---

## **⚙️ Toggles (`<Space>u*`)**

- `<Space>uf` - Toggle auto-format on save
- `<Space>ul` - Toggle line numbers
- `<Space>uw` - Toggle word wrap
- `<Space>us` - Toggle spell check
- `<Space>ud` - Toggle diagnostics
- `<Space>uc` - Toggle conceal (hidden characters)

---

## **🛠️ Utilities**

### Lazy Plugin Manager
- `<Space>l` - Open Lazy plugin manager
- In Lazy: `U` to update, `S` to sync, `X` to clean

### Mason (LSP/Tools Installer)
- `:Mason` - Open Mason installer
- In Mason: `i` to install, `u` to update, `X` to uninstall

### PDF Viewer
- `<Space>p` - Open PDF in Zathura (when on a .pdf file)

---

## **💡 Pro Tips**

1. **Press `<Space>` and wait** - A popup shows all available commands!
2. **In command mode (`:`)**, Tab gives autocomplete
3. **Telescope pickers** (file search, etc.):
   - `<Ctrl-n/p>` or arrow keys to navigate
   - `<Enter>` to select
   - `<Esc>` to cancel
4. **In insert mode**: `<Ctrl-Space>` triggers code completion
5. **Visual mode**: `v` to select, then use movement keys
6. **Visual line mode**: `V` to select entire lines

---

## **🚀 My Workflow for Python AI Development**

1. `cd` into project directory
2. `nvim` to open
3. `<Space>cv` to select virtual environment
4. `<Space><Space>` to find files
5. `<Ctrl-\>` to open terminal for Claude Code CLI
6. `gd` to jump to definitions
7. `<Space>cf` to format before saving
8. `<Ctrl-s>` to save

---

**Remember:** Vim has a learning curve, but these keybinds will make you incredibly fast once you learn them. Start with the "Most Essential" section and gradually add more!
