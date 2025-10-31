# Neovim Keybinds Reference

**Leader Key:** `<Space>`

---

## TABLE OF CONTENTS

- **MOVEMENT**: Cursor, Window, Buffer, Code Navigation
- **EDITING**: Basic Editing, Text Objects, Comments, Visual Mode
- **FILES & BUFFERS**: File Finding, File Explorer, Buffer Management
- **SEARCH & REPLACE**: Search, Replace
- **CODE**: LSP Actions, TypeScript
- **SPLITS & WINDOWS**: Creating, Resizing, Closing
- **TERMINAL**: Terminal Operations
- **GIT**: Git Operations, Conflicts
- **PYTHON**: Virtual Environment, Debugging
- **DATABASE**: Database UI
- **REST API**: HTTP Requests
- **HARPOON**: Quick File Pins
- **UTILITIES**: Toggles, Plugin Managers
- **WHICH-KEY MENUS**: Interactive Menu Triggers

---

## MOVEMENT

### Cursor Movement
- `h/j/k/l` - Left/Down/Up/Right
- `w` - Forward one word
- `b` - Backward one word
- `0` - Start of line
- `$` - End of line
- `gg` - Top of file
- `G` - Bottom of file
- `<Ctrl-d>` - Scroll down half page
- `<Ctrl-u>` - Scroll up half page
- `<Ctrl-o>` - Jump back to previous location
- `<Ctrl-i>` - Jump forward
- `*` - Search word under cursor

### Window Movement
- `<Ctrl-h>` - Move to left split
- `<Ctrl-j>` - Move to down split
- `<Ctrl-k>` - Move to up split
- `<Ctrl-l>` - Move to right split

### Buffer Movement
- `<Shift-h>` - Previous buffer
- `<Shift-l>` - Next buffer
- `<Ctrl-PageUp>` - Previous buffer (skip file explorer)
- `<Ctrl-PageDown>` - Next buffer (skip file explorer)

### Code Navigation
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `gy` - Go to type definition
- `gf` - Go to file under cursor
- `K` - Hover documentation
- `]]` - Next function/class
- `[[` - Previous function/class
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]e` - Next error
- `[e` - Previous error
- `]c` - Next git change
- `[c` - Previous git change

---

## EDITING

### Basic Editing
- `i` - Enter insert mode
- `<Esc>` - Exit insert mode
- `u` - Undo
- `<Ctrl-r>` - Redo
- `dd` - Delete line
- `yy` - Copy (yank) line
- `p` - Paste after cursor
- `P` - Paste before cursor
- `J` - Join line below to current line
- `<Alt-j>` - Move current line down
- `<Alt-k>` - Move current line up

### Text Objects
- `ciw` - Change inner word
- `ci"` - Change inside quotes
- `ci(` - Change inside parentheses
- `ci{` - Change inside braces
- `di(` - Delete inside parentheses
- `vi{` - Visual select inside braces

### Comments
- `gcc` - Toggle comment line
- `<Ctrl-/>` - Toggle comment (insert mode too)
- `gc` - Comment selected lines (visual mode)

### Visual Mode
- `v` - Visual mode (select characters)
- `V` - Visual line mode (select whole lines)
- `<Ctrl-v>` - Visual block mode (select columns)
- `d` - Delete selection
- `y` - Copy (yank) selection
- `c` - Change selection
- `>` - Indent right
- `<` - Indent left

---

## FILES & BUFFERS

### File Finding
- `<Space><Space>` - Find files (fuzzy search)
- `<Space>fr` - Recent files
- `<Space>fp` - Find/switch projects
- `<Space>e` - Toggle file explorer
- `:b <name>` - Quick switch to buffer by name

### File Explorer (Neo-tree)
- `.` - Toggle hidden files
- `<Backspace>` - Navigate up to parent
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `?` - Show all commands

### Buffer Management
- `<Space>bd` - Close current buffer
- `<Ctrl-s>` - Save file
- `:w` - Save file
- `:q` - Quit
- `:wq` or `ZZ` - Save and quit
- `:q!` - Quit without saving
- `:qa` - Quit all

---

## SEARCH & REPLACE

### Search
- `<Space>/` - Search text in project (grep)
- `<Space>sg` - Live grep (interactive)
- `<Space>ss` - Search symbols in file
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result

### Replace
- `<Space>sr` - Search and replace in project
- `:s/old/new/g` - Replace in current line
- `:%s/old/new/g` - Replace in entire file
- `:%s/old/new/gc` - Replace with confirmation

---

## CODE

### LSP Actions
- `<Space>ca` - Code actions
- `<Space>cr` - Rename symbol
- `<Space>cf` - Format file
- `<Space>cd` - Show line diagnostics

### TypeScript
- `<Space>co` - Organize imports
- `<Space>cR` - Rename file

---

## SPLITS & WINDOWS

### Creating Splits
- `:vsp` - Vertical split
- `:sp` - Horizontal split
- `<Space>-` - Split horizontally
- `<Space>|` - Split vertically

### Resizing Splits
- `<Ctrl-Up>` - Increase height
- `<Ctrl-Down>` - Decrease height
- `<Ctrl-Left>` - Decrease width
- `<Ctrl-Right>` - Increase width

### Closing Splits
- `:q` - Close current split
- `:qa` - Quit all
- `:only` - Close all other splits

---

## TERMINAL

- `<Ctrl-\>` - Toggle terminal
- `<Space>th` - Open horizontal terminal
- `<Space>tv` - Open vertical terminal
- `<Space>tf` - Open floating terminal
- `<Esc><Esc>` - Exit terminal mode (in terminal)

---

## GIT

- `<Space>gg` - Open LazyGit
- `<Space>gb` - Git blame current line
- `<Space>gB` - Git browse (open in browser)
- `<Space>gco` - Git conflict: choose ours
- `<Space>gct` - Git conflict: choose theirs
- `<Space>gcb` - Git conflict: choose both
- `<Space>gcn` - Git conflict: next
- `<Space>gcp` - Git conflict: previous

---

## PYTHON

### Virtual Environment
- `<Space>cv` - Select Python virtual environment

### Debugging (DAP)
- `<Space>db` - Toggle breakpoint
- `<Space>dc` - Start/continue debugging
- `<Space>di` - Step into function
- `<Space>do` - Step out of function
- `<Space>dO` - Step over

---

## DATABASE

- `<Space>db` - Toggle Database UI

---

## REST API

- `<Space>rr` - Run HTTP request (.http file)
- `<Space>rt` - Toggle HTTP result view
- `<Space>rc` - Copy request as cURL

---

## HARPOON

- `<Space>ha` - Harpoon: add current file
- `<Space>hh` - Harpoon: quick menu
- `<Space>1` - Jump to harpooned file 1
- `<Space>2` - Jump to harpooned file 2
- `<Space>3` - Jump to harpooned file 3
- `<Space>4` - Jump to harpooned file 4

---

## UTILITIES

### Toggles
- `<Space>uf` - Toggle auto-format on save
- `<Space>ul` - Toggle line numbers
- `<Space>uw` - Toggle word wrap
- `<Space>us` - Toggle spell check

### Plugin Managers
- `<Space>l` - Open Lazy plugin manager
- `:Mason` - Open Mason (LSP/tools installer)

### Other
- `<Space>p` - Open PDF in Zathura (.pdf file)
- `<Space>?` - Open this cheatsheet
- `<Space>fk` - Edit this cheatsheet file

---

## WHICH-KEY MENUS

Press and wait 1 second for interactive menus:

- `<Space>` - All leader commands
- `g` - Goto operations
- `]` - Next navigation
- `[` - Previous navigation
- `<Space>c` - Code actions
- `<Space>g` - Git operations
- `<Space>s` - Search operations
- `<Space>d` - Debug/Database
- `<Space>u` - UI toggles
- `?` (in Neo-tree) - All file explorer commands

In visual mode:
- `<Space>` - Operations on selection
- `g` - Goto for selection
