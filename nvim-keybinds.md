# LazyVim Keybindings Cheat Sheet

**Leader Key:** `<Space>`

**Priority Order:** Learn top sections first - they're 90% of what you'll use daily!

---

## **1. 🚨 Survival Mode - Can't Use Vim Without These**

*Why: You literally can't edit files, save, or quit without these*

### Basic Movement (USE THESE INSTEAD OF ARROW KEYS!)
- `h/j/k/l` - Left/Down/Up/Right
- `i` - Enter insert mode (start typing)
- `<Esc>` - Exit insert mode back to normal mode
- `u` - Undo
- `<Ctrl-r>` - Redo

### Save & Quit
- `<Ctrl-s>` - **Save file** (works in normal and insert mode)
- `:w` - Save file
- `:q` - Quit
- `:wq` or `ZZ` - Save and quit
- `:q!` - Quit without saving
- `:qa` - Quit all windows

---

## **2. 🔥 Daily Essentials - Use These Every 30 Seconds**

*Why: These make you productive. Without them, you're just using Notepad*

### File & Project Navigation
- `<Space><Space>` - **Find files** (fuzzy search) - YOUR MOST USED COMMAND
- `<Space>/` - **Search text in project** (grep) - SECOND MOST USED
- `<Space>e` - **Toggle file explorer**
- `<Space>fr` - Recent files
- `<Ctrl-o>` - Jump back to previous location
- `<Ctrl-i>` - Jump forward

### Terminal
- `<Ctrl-\>` - **Toggle terminal** (opens/closes, persists session)
- `<Space>th` - Open horizontal terminal at bottom
- `<Space>tv` - Open vertical terminal on right
- In terminal: `<Ctrl-h/j/k/l>` - Navigate to other splits

### Buffer Management (Switching Between Open Files)
- `<Shift-h>` - Previous buffer/file
- `<Shift-l>` - Next buffer/file
- `<Space>bd` - Close current buffer/file

---

## **3. 💻 Code Intelligence - What Makes This an IDE**

*Why: LSP features are why you use Neovim instead of nano/vim. This is the magic*

### Navigation
- `gd` - **Go to definition** (follow function/class to where it's defined)
- `gr` - **Find all references** (see everywhere this is used)
- `K` - **Hover documentation** (see type hints, docstrings, docs)
- `<Ctrl-o>` - Jump back after `gd`

### Code Actions & Refactoring
- `<Space>ca` - **Code actions** (auto-fix imports, quick fixes, refactorings)
- `<Space>cr` - **Rename symbol** (rename variable/function everywhere)
- `<Space>cf` - **Format file** (runs Ruff for Python, Prettier for JS/TS)
- `<Space>cd` - Show line diagnostics (errors/warnings)

### Diagnostics (Errors & Warnings)
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]e` - Next error
- `[e` - Previous error

---

## **4. 🪟 Splits & Windows - Working with Multiple Files**

*Why: Full-stack dev means viewing backend + frontend + terminal simultaneously*

### Creating Splits
- `:vsp` - Vertical split (side-by-side)
- `:sp` - Horizontal split (top/bottom)
- `<Space>-` - Split horizontally
- `<Space>|` - Split vertically

### Navigating Between Splits
- `<Ctrl-h>` - Move to left split
- `<Ctrl-j>` - Move to down split (or terminal)
- `<Ctrl-k>` - Move to up split
- `<Ctrl-l>` - Move to right split

### Resizing Splits
- `<Ctrl-Up>` - Increase height
- `<Ctrl-Down>` - Decrease height
- `<Ctrl-Left>` - Decrease width
- `<Ctrl-Right>` - Increase width

### Closing Splits
- `:q` - Close current split
- `:only` - Close all other splits

---

## **5. 📝 Efficient Editing - Moving & Changing Text Fast**

*Why: This is what makes Vim "fast". These save hundreds of keystrokes per day*

### Better Movement
- `w` - Jump forward one word
- `b` - Jump backward one word
- `0` - Start of line
- `$` - End of line
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `<Ctrl-d>` - Scroll down half page
- `<Ctrl-u>` - Scroll up half page

### Editing Commands
- `dd` - Delete line
- `yy` - Copy (yank) line
- `p` - Paste after cursor
- `P` - Paste before cursor
- `ciw` - Change inner word (delete word and enter insert mode)
- `ci"` - Change text inside quotes
- `di(` - Delete inside parentheses
- `vi{` - Visual select inside braces
- `<Alt-j>` - Move current line down
- `<Alt-k>` - Move current line up

### Visual Mode
- `v` - Visual mode (select characters)
- `V` - Visual line mode (select lines)
- `<Ctrl-v>` - Visual block mode (select columns)
- After selecting: `d` to delete, `y` to copy, `c` to change

---

## **6. 🔍 Search & Replace - Finding & Changing Text**

*Why: Necessary for refactoring and finding things, but less frequent than navigation*

- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `*` - Search for word under cursor
- `<Space>sr` - Search and replace in project
- `:s/old/new/g` - Replace in current line
- `:%s/old/new/g` - Replace in entire file
- `:%s/old/new/gc` - Replace with confirmation

---

## **7. 🐍 Python-Specific Features**

*Why: Useful but you won't use these every minute*

### Virtual Environment
- `<Space>cv` - Select Python virtual environment

### Debugging (DAP)
- `<Space>db` - Toggle breakpoint
- `<Space>dc` - Start/continue debugging
- `<Space>di` - Step into function
- `<Space>do` - Step out of function
- `<Space>dO` - Step over

---

## **8. 🎨 Git Integration**

*Why: Helpful but you might use terminal/GitHub Desktop more*

- `<Space>gg` - Open LazyGit
- `<Space>gb` - Git blame current line
- `<Space>gB` - Git browse (open in browser)
- `]h` - Next git hunk (change)
- `[h` - Previous git hunk
- `<Space>gco` - Git conflict: choose ours
- `<Space>gct` - Git conflict: choose theirs

---

## **9. 🛠️ Advanced Features - For Specific Workflows**

*Why: You'll use these when you need them, not every day*

### Project Management
- `<Space>fp` - Find/switch projects
- `<Space>ha` - Harpoon: add current file (pin favorites)
- `<Space>hh` - Harpoon: quick menu (see pinned files)
- `<Space>1-4` - Jump to harpooned file 1-4

### Database (DADBOD)
- `<Space>db` - Toggle Database UI (query PostgreSQL)

### REST API Testing
- `<Space>rr` - Run HTTP request (in .http file)
- `<Space>rt` - Toggle HTTP result view
- `<Space>rc` - Copy request as cURL

### Toggles (`<Space>u*`)
- `<Space>uf` - Toggle auto-format on save
- `<Space>ul` - Toggle line numbers
- `<Space>uw` - Toggle word wrap
- `<Space>us` - Toggle spell check

---

## **10. ⚙️ Utilities - Rarely Used but Good to Know**

*Why: You'll need these once in a while for maintenance*

### Lazy Plugin Manager
- `<Space>l` - Open Lazy plugin manager
- In Lazy: `U` to update, `S` to sync, `X` to clean

### Mason (LSP/Tools Installer)
- `:Mason` - Open Mason installer
- In Mason: `i` to install, `u` to update, `X` to uninstall

### PDF Viewer
- `<Space>p` - Open PDF in Zathura (when on a .pdf file)

---

## **💡 Common Workflows**

### Full Stack Development Layout:
```
1. cd ~/razorbill/web && nvim
2. <Space><Space> → backend/main.py
3. :vsp → vertical split
4. <Ctrl-l> → move right
5. <Space><Space> → frontend/App.tsx
6. <Space>th → terminal at bottom
7. <Ctrl-j> → move to terminal
8. Run: uvicorn main:app --reload
9. <Ctrl-k> → back to code
```
**You now have:** Backend | Frontend with terminal below!

### Quick Edit-Test-Commit Workflow:
```
1. Make code changes
2. <Ctrl-s> → save
3. <Ctrl-\> → toggle terminal
4. Run tests/linter
5. <Ctrl-\> → hide terminal
6. gd → check implementation
7. <Space>cf → format
8. <Ctrl-\> → show terminal
9. git add/commit
```

---

## **🎯 TL;DR - The 20% You'll Use 80% of the Time**

**Must memorize TODAY:**
1. `<Space><Space>` - Find files
2. `<Space>/` - Search in project
3. `<Ctrl-s>` - Save
4. `gd` - Go to definition
5. `<Ctrl-\>` - Toggle terminal
6. `<Ctrl-h/j/k/l>` - Navigate splits
7. `<Shift-h/l>` - Switch buffers
8. `<Space>ca` - Code actions
9. `<Esc>` - Exit insert mode
10. `i` - Enter insert mode

**Learn this week:**
- Basic movement: `h/j/k/l`, `w/b`, `0/$`
- Editing: `dd`, `yy`, `p`, `ciw`
- LSP: `gr`, `K`, `<Space>cr`, `<Space>cf`
- Splits: `:vsp`, `:sp`

**Learn eventually:**
- Everything else as you need it!

---

**Remember:** Press `<Space>` and wait - a popup shows all available commands!
