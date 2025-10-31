# Tmux Cheat Sheet

**Prefix Key:** `Ctrl-b` (press this before any tmux command)

**Auto-start:** tmux automatically starts when you open a terminal (configured in ~/.bashrc)

---

## **Getting Started**

```bash
tmux                    # Start new tmux session
tmux new -s myname      # Start named session
tmux ls                 # List sessions
tmux attach             # Attach to last session
tmux attach -t myname   # Attach to named session
tmux kill-session -t myname  # Kill named session
```

---

## **Essential Keybinds (20% you'll use 80% of the time)**

### Window Management (like browser tabs - WHAT YOU WANT FOR MULTIPLE UV ENVS)
- `Ctrl-b c` - **Create new window** (new terminal)
- `Ctrl-b n` - Next window
- `Ctrl-b p` - Previous window
- `Ctrl-b 0-9` - Jump to window number (0, 1, 2, etc.)
- `Ctrl-b ,` - Rename current window
- `Ctrl-b &` - Kill current window

### Session Management
- `Ctrl-b d` - **Detach** from session (keeps running in background)
- `Ctrl-b (` - Switch to previous session
- `Ctrl-b )` - Switch to next session
- `Ctrl-b s` - List all sessions (interactive picker)

### Panes (splits within a window)
- `Ctrl-b %` - Split pane vertically (left/right)
- `Ctrl-b "` - Split pane horizontally (top/bottom)
- `Ctrl-b arrow keys` - Navigate between panes
- `Ctrl-b x` - Kill current pane
- `Ctrl-b z` - Toggle pane zoom (fullscreen)

### Copy Mode (scroll/search history)
- `Ctrl-b [` - Enter copy mode (use arrow keys to scroll)
- `q` - Exit copy mode
- `/` - Search forward (in copy mode)
- `?` - Search backward (in copy mode)

---

## **Your Workflow: Multiple UV Environments**

```bash
# Start tmux
tmux new -s dev

# Window 0: First project
cd ~/project1
source .venv/bin/activate
# work here...

# Create new window for second project
Ctrl-b c  # Creates window 1

# Window 1: Second project
cd ~/project2
source .venv2/bin/activate
# work here...

# Create third window
Ctrl-b c  # Creates window 2

# Now switch between them:
Ctrl-b 0  # Jump to project 1
Ctrl-b 1  # Jump to project 2
Ctrl-b 2  # Jump to project 3
# Or use Ctrl-b n / Ctrl-b p to cycle
```

---

## **Status Bar (bottom of screen)**

Shows:
- `[0] window-name*` - Current window is marked with *
- Session name on left
- Date/time on right

---

## **Tips**

1. **Name your windows** - `Ctrl-b ,` then type "backend", "frontend", etc.
2. **Detach often** - `Ctrl-b d` lets you close your terminal but keep everything running
3. **Use numbered jumps** - `Ctrl-b 0`, `Ctrl-b 1` is faster than cycling
4. **tmux persists** - If you close your terminal, tmux keeps running. Reattach with `tmux attach`

---

## **Most Used Commands**

1. `Ctrl-b c` - New window (for new UV env)
2. `Ctrl-b 0-9` - Jump to window
3. `Ctrl-b ,` - Rename window
4. `Ctrl-b d` - Detach session
5. `tmux attach` - Reattach

---

## **Advanced: Custom Config (optional)**

Create `~/.tmux.conf` to customize:
```bash
# Enable mouse support
set -g mouse on

# Start windows at 1 instead of 0
set -g base-index 1

# More intuitive split commands
bind | split-window -h
bind - split-window -v
```

Then reload: `tmux source-file ~/.tmux.conf`
