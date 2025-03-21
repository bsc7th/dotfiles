![bsc7th-neovim](assets/bsc7th-neovim.jpg)

# bsc7th's dotfiles

Most of my plugins come from [Folke's](https://github.com/folke) Neovim config, with a few others from talented developers at Neovim Spectrum. My workflow is inspired by [Josean Martinez's](https://github.com/josean-dev) and [Takuya Matsuyama](https://github.com/craftzdog), also known as [craftzdog](https://github.com/craftzdog) or [devaslife](https://www.youtube.com/results?search_query=devaslife) on YouTube. You can also use the Neovim website as a guide, as it provides detailed information on each repository, helping you better understand how things work.

## My Current Plugins

### [solarized-osaka](https://dotfyle.com/plugins/craftzdog/solarized-osaka.nvim)

A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.

### [conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

Lightweight yet powerful formatter plugin for Neovim

### [copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)

Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot

### [vim-dadbod-ui](https://github.com/bsc7th/dotfiles/blob/main/nvim/lua/bsc7th/plugins/dadbod-ui.lua)

A remote neovim plugin for viewing Dadbod query results in a web browser

### [dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)

Neovim plugin to improve the default vim.ui interfaces

### [emoji.nvim](https://dotfyle.com/plugins/allaman/emoji.nvim)

A plugin to search for and insert emojis/kaomojis, with auto-completion support, right from Neovim

### [gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

A Git integration plugin for Neovim that provides signs and hunk actions in the sign column

### [glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)

A markdown preview directly in your neovim.

### [inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)

Incremental LSP renaming based on Neovim's command-preview feature.

### [incline.nvim](https://dotfyle.com/plugins/b0o/incline.nvim)

Floating statuslines for Neovim, winbar alternative

### [lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)

Plugin for calling lazygit from within neovim.

### [mardown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/markdown.nvim)

Plugin to improve viewing Markdown files in Neovim

### [mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

Easily install and manage LSP servers, DAP servers, linters, and formatters.

### [mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)

Icon provider. Part of 'mini.nvim' library.

### [noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

### [nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

A completion plugin for neovim coded in Lua.

### [nvim-colorizer.lua](https://dotfyle.com/plugins/catgoose/nvim-colorizer.lua)

The fastest Neovim colorizer

### [nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)

Quickstart configs for Nvim LSP

### [nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

A fancy, configurable, notification manager for NeoVim

### [oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

Neovim file explorer: edit your filesystem like a buffer

### [plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

Plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.

### [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)

Neovim plugin developed by ThePrimeagen that facilitates code refactoring within the editor.

### [rest.nvim](https://dotfyle.com/plugins/rest-nvim/rest.nvim)

A very fast, powerful, extensible and asynchronous Neovim HTTP client written in Lua.

### [snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)

A collection of QoL plugins for Neovim

### [substitute.nvim](https://dotfyle.com/plugins/gbprod/substitute.nvim)

Neovim plugin introducing a new operators motions to quickly replace and exchange text.

### [nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)

Add/change/delete surrounding delimiter pairs with ease. Written with :heart: in Lua.

### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

Seamless navigation between tmux panes and vim splits

### [todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

Highlight, list and search todo comments in your projects

### [nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

Nvim Treesitter configurations and abstraction layer

### [trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.

### [vim-maximizer](https://github.com/szw/vim-maximizer)

Maximizes and restores the current window in Vim.

### [which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.

### [zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)

Distraction-free coding for Neovim

## TMUX Configuration

I use [Takuya Matsuyama](https://github.com/craftzdog) tmux custom theme and [Josean Martinez's](https://github.com/josean-dev?tab=repositories) keybindings.

![bsc7th-tmux](assets/bsc7th-tmux.jpg)

### tmux.conf

```
set -g default-terminal "screen-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
set -g default-terminal "tmux-256color"

# Wezterm
set -as terminal-features ",wezterm:RGB"

# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

## Fix titlebar
set -g set-titles on
set -g set-titles-string "#T"

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

bind -r m resize-pane -Z

set -g mouse off

set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

# Set the status bar to show the Git branch and project name
set -g status-right '#(git -C #{pane_current_path} rev-parse --abbrev-ref HEAD 2>/dev/null) | #{pane_current_path}'

# Display lazygit
bind -r g display-popup -d '#{pane_current_path}' -w80% -h80% -E lazygit

# TPM plugin
set -g @plugin 'tmux-plugins/tpm'

# List of plugins
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/default/gray'

source ~/.config/tmux/theme.conf
source ~/.config/tmux/statusline.conf
source ~/.config/tmux/utility.conf

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run "~/.tmux/plugins/tpm/tpm"
```

### craftzdog macos.conf

```
# osx clipboard
set-option -g default-command "which reattach-to-user-namespace > /dev/null && reattach-to-user-namespace -l $SHELL || $SHELL"

# Undercurl
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

### craftzdog statusline.conf

```
# vim: ft=tmux
set -g mode-style "fg=#eee8d5,bg=#073642"

set -g message-style "fg=#eee8d5,bg=#073642"
set -g message-command-style "fg=#eee8d5,bg=#073642"

set -g pane-border-style "fg=#073642"
set -g pane-active-border-style "fg=#eee8d5"

set -g status "on"
set -g status-interval 1
set -g status-justify "left"

set -g status-style "fg=#586e75,bg=#073642"

set -g status-bg "#002b36"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#073642,bg=#eee8d5,bold] #S #[fg=#eee8d5,bg=#93a1a1,nobold,nounderscore,noitalics]#[fg=#15161E,bg=#93a1a1,bold] #(whoami) #[fg=#93a1a1,bg=#002b36]"
set -g status-right "#[fg=#586e75,bg=#002b36,nobold,nounderscore,noitalics]#[fg=#93a1a1,bg=#586e75]#[fg=#657b83,bg=#586e75,nobold,nounderscore,noitalics]#[fg=#93a1a1,bg=#657b83]#[fg=#93a1a1,bg=#657b83,nobold,nounderscore,noitalics]#[fg=#15161E,bg=#93a1a1,bold] #h "

setw -g window-status-activity-style "underscore,fg=#839496,bg=#002b36"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#839496,bg=#002b36"
setw -g window-status-format '#[fg=#002b36,bg=#002b36]#[default] #I  #{b:pane_current_path} #[fg=#002b36,bg=#002b36,nobold,nounderscore,noitalics]'
setw -g window-status-current-format '#[fg=#002b36,bg=#eee8d5]#[fg=#b58900,bg=#eee8d5] #I #[fg=#eee8d5,bg=#b58900] #{b:pane_current_path} #[fg=#b58900,bg=#002b36,nobold]'
```

### cratfzdog theme.conf

```
#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-style bg=colour235,fg=colour136,default

# default window title colors
set-window-option -g window-status-style fg=colour244,bg=colour234,dim

# active window title colors
set-window-option -g window-status-current-style fg=colour166,bg=default,bright

# pane border
set-option -g pane-border-style fg=colour235 #base02
set-option -g pane-active-border-style fg=colour136,bg=colour235

# message text
set-option -g message-style bg=colour235,fg=colour166

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green
```

### craftzdog utility.conf

```
# Display lazygit
bind -r g display-popup -d '#{pane_current_path}' -w80% -h80% -E lazygit
```

## Yazi

![bsc7th-yazi](assets/bsc7th-yazi.jpg)

### keymap.toml

```
# A TOML linter such as https://taplo.tamasfe.dev/ can use this schema to validate your config.
# If you encounter any issues, please make an issue at https://github.com/yazi-rs/schemas.
"$schema" = "https://yazi-rs.github.io/schemas/keymap.json"

[manager]

keymap = [
	{ on = "<Esc>", run = "escape",             desc = "Exit visual mode, clear selected, or cancel search" },
	{ on = "<C-[>", run = "escape",             desc = "Exit visual mode, clear selected, or cancel search" },
	{ on = "q",     run = "quit",               desc = "Quit the process" },
	{ on = "Q",     run = "quit --no-cwd-file", desc = "Quit the process without outputting cwd-file" },
	{ on = "<C-c>", run = "close",              desc = "Close the current tab, or quit if it's last" },
	{ on = "<C-z>", run = "suspend",            desc = "Suspend the process" },

	# Hopping
	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",    run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>",  run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<C-u>", run = "arrow -50%",  desc = "Move cursor up half page" },
	{ on = "<C-d>", run = "arrow 50%",   desc = "Move cursor down half page" },
	{ on = "<C-b>", run = "arrow -100%", desc = "Move cursor up one page" },
	{ on = "<C-f>", run = "arrow 100%",  desc = "Move cursor down one page" },

	{ on = "<S-PageUp>",   run = "arrow -50%",  desc = "Move cursor up half page" },
	{ on = "<S-PageDown>", run = "arrow 50%",   desc = "Move cursor down half page" },
	{ on = "<PageUp>",     run = "arrow -100%", desc = "Move cursor up one page" },
	{ on = "<PageDown>",   run = "arrow 100%",  desc = "Move cursor down one page" },

	{ on = [ "g", "g" ], run = "arrow top", desc = "Move cursor to the top" },
	{ on = "G",          run = "arrow bot",  desc = "Move cursor to the bottom" },

	# Navigation
	{ on = "h", run = "leave", desc = "Go back to the parent directory" },
	{ on = "l", run = "enter", desc = "Enter the child directory" },

	{ on = "<Left>",  run = "leave", desc = "Go back to the parent directory" },
	{ on = "<Right>", run = "enter", desc = "Enter the child directory" },

	{ on = "H", run = "back",    desc = "Go back to the previous directory" },
	{ on = "L", run = "forward", desc = "Go forward to the next directory" },

	# Toggle
	{ on = "<Space>", run = [ "toggle", "arrow 1" ], desc = "Toggle the current selection state" },
	{ on = "<C-a>",   run = "toggle_all --state=on", desc = "Select all files" },
	{ on = "<S-r>",   run = "toggle_all",            desc = "Invert selection of all files" },

	# Visual mode
	{ on = "v", run = "visual_mode",         desc = "Enter visual mode (selection mode)" },
	{ on = "V", run = "visual_mode --unset", desc = "Enter visual mode (unset mode)" },

	# Seeking
	{ on = "K", run = "seek -5", desc = "Seek up 5 units in the preview" },
	{ on = "J", run = "seek 5",  desc = "Seek down 5 units in the preview" },

	# Spotting
	{ on = "<Tab>", run = "spot", desc = "Spot hovered file" },

	# Operation
	{ on = "o",         run = "open",                        desc = "Open selected files" },
	{ on = "O",         run = "open --interactive",          desc = "Open selected files interactively" },
	{ on = "<Enter>",   run = "open",                        desc = "Open selected files" },
	{ on = "<S-Enter>", run = "open --interactive",          desc = "Open selected files interactively" },
	{ on = "y",         run = "yank",                        desc = "Yank selected files (copy)" },
	{ on = "x",         run = "yank --cut",                  desc = "Yank selected files (cut)" },
	{ on = "p",         run = "paste",                       desc = "Paste yanked files" },
	{ on = "P",         run = "paste --force",               desc = "Paste yanked files (overwrite if the destination exists)" },
	{ on = "-",         run = "link",                        desc = "Symlink the absolute path of yanked files" },
	{ on = "_",         run = "link --relative",             desc = "Symlink the relative path of yanked files" },
	{ on = "<C-->",     run = "hardlink",                    desc = "Hardlink yanked files" },
	{ on = "Y",         run = "unyank",                      desc = "Cancel the yank status" },
	{ on = "X",         run = "unyank",                      desc = "Cancel the yank status" },
	{ on = "d",         run = "remove",                      desc = "Trash selected files" },
	{ on = "D",         run = "remove --permanently",        desc = "Permanently delete selected files" },
	{ on = "a",         run = "create",                      desc = "Create a file (ends with / for directories)" },
	{ on = "r",         run = "rename --cursor=before_ext",  desc = "Rename selected file(s)" },
	{ on = ";",         run = "shell --interactive",         desc = "Run a shell command" },
	{ on = ":",         run = "shell --block --interactive", desc = "Run a shell command (block until finishes)" },
	{ on = ".",         run = "hidden toggle",               desc = "Toggle the visibility of hidden files" },
	{ on = "s",         run = "search --via=fd",             desc = "Search files by name via fd" },
	{ on = "S",         run = "search --via=rg",             desc = "Search files by content via ripgrep" },
	{ on = "<C-s>",     run = "escape --search",             desc = "Cancel the ongoing search" },
	{ on = "z",         run = "plugin zoxide",               desc = "Jump to a directory via zoxide" },
	{ on = "Z",         run = "plugin fzf",                  desc = "Jump to a file/directory via fzf" },

	# Linemode
	{ on = [ "m", "s" ], run = "linemode size",        desc = "Linemode: size" },
	{ on = [ "m", "p" ], run = "linemode permissions", desc = "Linemode: permissions" },
	{ on = [ "m", "b" ], run = "linemode btime",       desc = "Linemode: btime" },
	{ on = [ "m", "m" ], run = "linemode mtime",       desc = "Linemode: mtime" },
	{ on = [ "m", "o" ], run = "linemode owner",       desc = "Linemode: owner" },
	{ on = [ "m", "n" ], run = "linemode none",        desc = "Linemode: none" },

	# Copy
	{ on = [ "c", "c" ], run = "copy path",             desc = "Copy the file path" },
	{ on = [ "c", "d" ], run = "copy dirname",          desc = "Copy the directory path" },
	{ on = [ "c", "f" ], run = "copy filename",         desc = "Copy the filename" },
	{ on = [ "c", "n" ], run = "copy name_without_ext", desc = "Copy the filename without extension" },

	# Filter
	{ on = "f", run = "filter --smart", desc = "Filter files" },

	# Find
	{ on = "/", run = "find --smart",            desc = "Find next file" },
	{ on = "?", run = "find --previous --smart", desc = "Find previous file" },
	{ on = "n", run = "find_arrow",              desc = "Goto the next found" },
	{ on = "N", run = "find_arrow --previous",   desc = "Goto the previous found" },

	# Sorting
	{ on = [ ",", "m" ], run = [ "sort mtime --reverse=no", "linemode mtime" ], desc = "Sort by modified time" },
	{ on = [ ",", "M" ], run = [ "sort mtime --reverse", "linemode mtime" ],    desc = "Sort by modified time (reverse)" },
	{ on = [ ",", "b" ], run = [ "sort btime --reverse=no", "linemode btime" ], desc = "Sort by birth time" },
	{ on = [ ",", "B" ], run = [ "sort btime --reverse", "linemode btime" ],    desc = "Sort by birth time (reverse)" },
	{ on = [ ",", "e" ], run = "sort extension --reverse=no",                   desc = "Sort by extension" },
	{ on = [ ",", "E" ], run = "sort extension --reverse",                      desc = "Sort by extension (reverse)" },
	{ on = [ ",", "a" ], run = "sort alphabetical --reverse=no",                desc = "Sort alphabetically" },
	{ on = [ ",", "A" ], run = "sort alphabetical --reverse",                   desc = "Sort alphabetically (reverse)" },
	{ on = [ ",", "n" ], run = "sort natural --reverse=no",                     desc = "Sort naturally" },
	{ on = [ ",", "N" ], run = "sort natural --reverse",                        desc = "Sort naturally (reverse)" },
	{ on = [ ",", "s" ], run = [ "sort size --reverse=no", "linemode size" ],   desc = "Sort by size" },
	{ on = [ ",", "S" ], run = [ "sort size --reverse", "linemode size" ],      desc = "Sort by size (reverse)" },
	{ on = [ ",", "r" ], run = "sort random --reverse=no",                      desc = "Sort randomly" },

	# Goto
	{ on = [ "g", "h" ],       run = "cd ~",             desc = "Go home" },
	{ on = [ "g", "c" ],       run = "cd ~/.config",     desc = "Goto ~/.config" },
	{ on = [ "g", "d" ],       run = "cd ~/Downloads",   desc = "Goto ~/Downloads" },
	{ on = [ "g", "<Space>" ], run = "cd --interactive", desc = "Jump interactively" },

	# Tabs
	{ on = "t", run = "tab_create --current", desc = "Create a new tab with CWD" },

	{ on = "1", run = "tab_switch 0", desc = "Switch to the first tab" },
	{ on = "2", run = "tab_switch 1", desc = "Switch to the second tab" },
	{ on = "3", run = "tab_switch 2", desc = "Switch to the third tab" },
	{ on = "4", run = "tab_switch 3", desc = "Switch to the fourth tab" },
	{ on = "5", run = "tab_switch 4", desc = "Switch to the fifth tab" },
	{ on = "6", run = "tab_switch 5", desc = "Switch to the sixth tab" },
	{ on = "7", run = "tab_switch 6", desc = "Switch to the seventh tab" },
	{ on = "8", run = "tab_switch 7", desc = "Switch to the eighth tab" },
	{ on = "9", run = "tab_switch 8", desc = "Switch to the ninth tab" },

	{ on = "[", run = "tab_switch -1 --relative", desc = "Switch to the previous tab" },
	{ on = "]", run = "tab_switch 1 --relative",  desc = "Switch to the next tab" },

	{ on = "{", run = "tab_swap -1", desc = "Swap current tab with previous tab" },
	{ on = "}", run = "tab_swap 1",  desc = "Swap current tab with next tab" },

	# Tasks
	{ on = "w", run = "tasks_show", desc = "Show task manager" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[tasks]

keymap = [
	{ on = "<Esc>", run = "close", desc = "Close task manager" },
	{ on = "<C-[>", run = "close", desc = "Close task manager" },
	{ on = "<C-c>", run = "close", desc = "Close task manager" },
	{ on = "w",     run = "close", desc = "Close task manager" },

	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",   run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Enter>", run = "inspect", desc = "Inspect the task" },
	{ on = "x",       run = "cancel",  desc = "Cancel the task" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[spot]

keymap = [
	{ on = "<Esc>", run = "close", desc = "Close the spot" },
	{ on = "<C-[>", run = "close", desc = "Close the spot" },
	{ on = "<C-c>", run = "close", desc = "Close the spot" },
	{ on = "<Tab>", run = "close", desc = "Close the spot" },

	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },
	{ on = "h", run = "swipe -1", desc = "Swipe to the previous file" },
	{ on = "l", run = "swipe 1",  desc = "Swipe to the next file" },

	{ on = "<Up>",    run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>",  run = "arrow 1",  desc = "Move cursor down" },
	{ on = "<Left>",  run = "swipe -1", desc = "Swipe to the next file" },
	{ on = "<Right>", run = "swipe 1",  desc = "Swipe to the previous file" },

	# Copy
	{ on = [ "c", "c" ], run = "copy cell", desc = "Copy selected cell" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[pick]

keymap = [
	{ on = "<Esc>",   run = "close",          desc = "Cancel pick" },
	{ on = "<C-[>",   run = "close",          desc = "Cancel pick" },
	{ on = "<C-c>",   run = "close",          desc = "Cancel pick" },
	{ on = "<Enter>", run = "close --submit", desc = "Submit the pick" },

	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",   run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>", run = "arrow 1",  desc = "Move cursor down" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[input]

keymap = [
	{ on = "<C-c>",   run = "close",          desc = "Cancel input" },
	{ on = "<Enter>", run = "close --submit", desc = "Submit input" },
	{ on = "<Esc>",   run = "escape",         desc = "Go back the normal mode, or cancel input" },
	{ on = "<C-[>",   run = "escape",         desc = "Go back the normal mode, or cancel input" },

	# Mode
	{ on = "i", run = "insert",                             desc = "Enter insert mode" },
	{ on = "I", run = [ "move first-char", "insert" ],      desc = "Move to the BOL, and enter insert mode" },
	{ on = "a", run = "insert --append",                    desc = "Enter append mode" },
	{ on = "A", run = [ "move eol", "insert --append" ],    desc = "Move to the EOL, and enter append mode" },
	{ on = "v", run = "visual",                             desc = "Enter visual mode" },
	{ on = "V", run = [ "move bol", "visual", "move eol" ], desc = "Enter visual mode and select all" },
	{ on = "r", run = "replace",                            desc = "Replace a single character" },

	# Character-wise movement
	{ on = "h",       run = "move -1", desc = "Move back a character" },
	{ on = "l",       run = "move 1",  desc = "Move forward a character" },
	{ on = "<Left>",  run = "move -1", desc = "Move back a character" },
	{ on = "<Right>", run = "move 1",  desc = "Move forward a character" },
	{ on = "<C-b>",   run = "move -1", desc = "Move back a character" },
	{ on = "<C-f>",   run = "move 1",  desc = "Move forward a character" },

	# Word-wise movement
	{ on = "b",     run = "backward",                    desc = "Move back to the start of the current or previous word" },
	{ on = "B",     run = "backward --far",              desc = "Move back to the start of the current or previous WORD" },
	{ on = "w",     run = "forward",                     desc = "Move forward to the start of the next word" },
	{ on = "W",     run = "forward --far",               desc = "Move forward to the start of the next WORD" },
	{ on = "e",     run = "forward --end-of-word",       desc = "Move forward to the end of the current or next word" },
	{ on = "E",     run = "forward --far --end-of-word", desc = "Move forward to the end of the current or next WORD" },
	{ on = "<A-b>", run = "backward",                    desc = "Move back to the start of the current or previous word" },
	{ on = "<A-f>", run = "forward --end-of-word",       desc = "Move forward to the end of the current or next word" },

	# Line-wise movement
	{ on = "0",      run = "move bol",        desc = "Move to the BOL" },
	{ on = "$",      run = "move eol",        desc = "Move to the EOL" },
	{ on = "_",      run = "move first-char", desc = "Move to the first non-whitespace character" },
	{ on = "^",      run = "move first-char", desc = "Move to the first non-whitespace character" },
	{ on = "<C-a>",  run = "move bol",        desc = "Move to the BOL" },
	{ on = "<C-e>",  run = "move eol",        desc = "Move to the EOL" },
	{ on = "<Home>", run = "move bol",        desc = "Move to the BOL" },
	{ on = "<End>",  run = "move eol",        desc = "Move to the EOL" },

	# Delete
	{ on = "<Backspace>", run = "backspace",         desc = "Delete the character before the cursor" },
	{ on = "<Delete>",    run = "backspace --under", desc = "Delete the character under the cursor" },
	{ on = "<C-h>",       run = "backspace",         desc = "Delete the character before the cursor" },
	{ on = "<C-d>",       run = "backspace --under", desc = "Delete the character under the cursor" },

	# Kill
	{ on = "<C-u>", run = "kill bol",      desc = "Kill backwards to the BOL" },
	{ on = "<C-k>", run = "kill eol",      desc = "Kill forwards to the EOL" },
	{ on = "<C-w>", run = "kill backward", desc = "Kill backwards to the start of the current word" },
	{ on = "<A-d>", run = "kill forward",  desc = "Kill forwards to the end of the current word" },

	# Cut/Yank/Paste
	{ on = "d", run = "delete --cut",                              desc = "Cut the selected characters" },
	{ on = "D", run = [ "delete --cut", "move eol" ],              desc = "Cut until the EOL" },
	{ on = "c", run = "delete --cut --insert",                     desc = "Cut the selected characters, and enter insert mode" },
	{ on = "C", run = [ "delete --cut --insert", "move eol" ],     desc = "Cut until the EOL, and enter insert mode" },
	{ on = "x", run = [ "delete --cut", "move 1 --in-operating" ], desc = "Cut the current character" },
	{ on = "y", run = "yank",                                      desc = "Copy the selected characters" },
	{ on = "p", run = "paste",                                     desc = "Paste the copied characters after the cursor" },
	{ on = "P", run = "paste --before",                            desc = "Paste the copied characters before the cursor" },

	# Undo/Redo
	{ on = "u",     run = "undo", desc = "Undo the last operation" },
	{ on = "<C-r>", run = "redo", desc = "Redo the last operation" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[confirm]

keymap = [
	{ on = "<Esc>",   run = "close",          desc = "Cancel the confirm" },
	{ on = "<C-[>",   run = "close",          desc = "Cancel the confirm" },
	{ on = "<C-c>",   run = "close",          desc = "Cancel the confirm" },
	{ on = "<Enter>", run = "close --submit", desc = "Submit the confirm" },

	{ on = "n", run = "close",          desc = "Cancel the confirm" },
	{ on = "y", run = "close --submit", desc = "Submit the confirm" },

	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",   run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>", run = "arrow 1",  desc = "Move cursor down" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[cmp]

keymap = [
	{ on = "<C-c>",   run = "close",                                      desc = "Cancel completion" },
	{ on = "<Tab>",   run = "close --submit",                             desc = "Submit the completion" },
	{ on = "<Enter>", run = [ "close --submit", "close_input --submit" ], desc = "Submit the completion and input" },

	{ on = "<A-k>", run = "arrow -1", desc = "Move cursor up" },
	{ on = "<A-j>", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",   run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<C-p>", run = "arrow -1", desc = "Move cursor up" },
	{ on = "<C-n>", run = "arrow 1",  desc = "Move cursor down" },

	# Help
	{ on = "~",    run = "help", desc = "Open help" },
	{ on = "<F1>", run = "help", desc = "Open help" },
]

[help]

keymap = [
	{ on = "<Esc>", run = "escape", desc = "Clear the filter, or hide the help" },
	{ on = "<C-[>", run = "escape", desc = "Clear the filter, or hide the help" },
	{ on = "<C-c>", run = "close",  desc = "Hide the help" },

	# Navigation
	{ on = "k", run = "arrow -1", desc = "Move cursor up" },
	{ on = "j", run = "arrow 1",  desc = "Move cursor down" },

	{ on = "<Up>",   run = "arrow -1", desc = "Move cursor up" },
	{ on = "<Down>", run = "arrow 1",  desc = "Move cursor down" },

	# Filtering
	{ on = "f", run = "filter", desc = "Apply a filter for the help items" },
]
```

### yazi.toml

```
# A TOML linter such as https://taplo.tamasfe.dev/ can use this schema to validate your config.
# If you encounter any issues, please make an issue at https://github.com/yazi-rs/schemas.
"$schema" = "https://yazi-rs.github.io/schemas/yazi.json"

[manager]
ratio          = [ 1, 2, 3 ]
sort_by        = "alphabetical"
sort_sensitive = false
sort_reverse 	 = false
sort_dir_first = true
sort_translit  = false
linemode       = "none"
show_hidden    = true
show_symlink   = true
scrolloff      = 5
mouse_events   = [ "click", "scroll" ]
title_format   = "Yazi: {cwd}"

[preview]
wrap            = "yes"
tab_size        = 2
max_width       = 1200
max_height      = 1000
cache_dir       = ""
image_delay     = 30
image_filter    = "triangle"
image_quality   = 75
sixel_fraction  = 15
ueberzug_scale  = 1
ueberzug_offset = [ 0, 0, 0, 0 ]

[opener]
edit = [
	{ run = '${EDITOR:-vi} "$@"', desc = "$EDITOR", block = true, for = "unix" },
	{ run = 'code %*',    orphan = true, desc = "code",           for = "windows" },
	{ run = 'code -w %*', block = true,  desc = "code (block)",   for = "windows" },
]
open = [
	{ run = 'xdg-open "$1"',                desc = "Open", for = "linux" },
	{ run = 'open "$@"',                    desc = "Open", for = "macos" },
	{ run = 'start "" "%1"', orphan = true, desc = "Open", for = "windows" },
	{ run = 'termux-open "$1"',             desc = "Open", for = "android" },
]
reveal = [
	{ run = 'xdg-open "$(dirname "$1")"',           desc = "Reveal", for = "linux" },
	{ run = 'open -R "$1"',                         desc = "Reveal", for = "macos" },
	{ run = 'explorer /select,"%1"', orphan = true, desc = "Reveal", for = "windows" },
	{ run = 'termux-open "$(dirname "$1")"',        desc = "Reveal", for = "android" },
	{ run = '''exiftool "$1"; echo "Press enter to exit"; read _''', block = true, desc = "Show EXIF", for = "unix" },
]
extract = [
	{ run = 'ya pub extract --list "$@"', desc = "Extract here", for = "unix" },
	{ run = 'ya pub extract --list %*',   desc = "Extract here", for = "windows" },
]
play = [
	{ run = 'mpv --force-window "$@"', orphan = true, for = "unix" },
	{ run = 'mpv --force-window %*', orphan = true, for = "windows" },
	{ run = '''mediainfo "$1"; echo "Press enter to exit"; read _''', block = true, desc = "Show media info", for = "unix" },
]

[open]
rules = [
	# Folder
	{ name = "*/", use = [ "edit", "open", "reveal" ] },
	# Text
	{ mime = "text/*", use = [ "edit", "reveal" ] },
	# Image
	{ mime = "image/*", use = [ "open", "reveal" ] },
	# Media
	{ mime = "{audio,video}/*", use = [ "play", "reveal" ] },
	# Archive
	{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", use = [ "extract", "reveal" ] },
	# JSON
	{ mime = "application/{json,ndjson}", use = [ "edit", "reveal" ] },
	{ mime = "*/javascript", use = [ "edit", "reveal" ] },
	# Empty file
	{ mime = "inode/empty", use = [ "edit", "reveal" ] },
	# Fallback
	{ name = "*", use = [ "open", "reveal" ] },
]

[tasks]
micro_workers    = 10
macro_workers    = 10
bizarre_retry    = 3
image_alloc      = 536870912  # 512MB
image_bound      = [ 0, 0 ]
suppress_preload = false

[plugin]
fetchers = [
	# Mimetype
	{ id = "mime", name = "*", run = "mime", prio = "high" },
]
spotters = [
	{ name = "*/", run = "folder" },
	# Code
	{ mime = "text/*", run = "code" },
	{ mime = "application/{mbox,javascript,wine-extension-ini}", run = "code" },
	# Image
	{ mime = "image/{avif,hei?,jxl,svg+xml}", run = "magick" },
	{ mime = "image/*", run = "image" },
	# Video
	{ mime = "video/*", run = "video" },
	# Fallback
	{ name = "*", run = "file" },
]
preloaders = [
	# Image
	{ mime = "image/{avif,hei?,jxl,svg+xml}", run = "magick" },
	{ mime = "image/*", run = "image" },
	# Video
	{ mime = "video/*", run = "video" },
	# PDF
	{ mime = "application/pdf", run = "pdf" },
	# Font
	{ mime = "font/*", run = "font" },
	{ mime = "application/ms-opentype", run = "font" },
]
previewers = [
	{ name = "*/", run = "folder", sync = true },
	# Code
	{ mime = "text/*", run = "code" },
	{ mime = "application/{mbox,javascript,wine-extension-ini}", run = "code" },
	# JSON
	{ mime = "application/{json,ndjson}", run = "json" },
	# Image
	{ mime = "image/{avif,hei?,jxl,svg+xml}", run = "magick" },
	{ mime = "image/*", run = "image" },
	# Video
	{ mime = "video/*", run = "video" },
	# PDF
	{ mime = "application/pdf", run = "pdf" },
	# Archive
	{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", run = "archive" },
	{ mime = "application/{debian*-package,redhat-package-manager,rpm,android.package-archive}", run = "archive" },
	{ name = "*.{AppImage,appimage}", run = "archive" },
	# Virtual Disk / Disk Image
	{ mime = "application/{iso9660-image,qemu-disk,ms-wim,apple-diskimage}", run = "archive" },
	{ mime = "application/virtualbox-{vhd,vhdx}", run = "archive" },
	{ name = "*.{img,fat,ext,ext2,ext3,ext4,squashfs,ntfs,hfs,hfsx}", run = "archive" },
	# Font
	{ mime = "font/*", run = "font" },
	{ mime = "application/ms-opentype", run = "font" },
	# Empty file
	{ mime = "inode/empty", run = "empty" },
	# Fallback
	{ name = "*", run = "file" },
]

[input]
cursor_blink = false

# cd
cd_title  = "Change directory:"
cd_origin = "top-center"
cd_offset = [ 0, 2, 50, 3 ]

# create
create_title  = [ "Create:", "Create (dir):" ]
create_origin = "top-center"
create_offset = [ 0, 2, 50, 3 ]

# rename
rename_title  = "Rename:"
rename_origin = "hovered"
rename_offset = [ 0, 1, 50, 3 ]

# filter
filter_title  = "Filter:"
filter_origin = "top-center"
filter_offset = [ 0, 2, 50, 3 ]

# find
find_title  = [ "Find next:", "Find previous:" ]
find_origin = "top-center"
find_offset = [ 0, 2, 50, 3 ]

# search
search_title  = "Search via {n}:"
search_origin = "top-center"
search_offset = [ 0, 2, 50, 3 ]

# shell
shell_title  = [ "Shell:", "Shell (block):" ]
shell_origin = "top-center"
shell_offset = [ 0, 2, 50, 3 ]

[confirm]
# trash
trash_title 	= "Trash {n} selected file{s}?"
trash_origin	= "center"
trash_offset	= [ 0, 0, 70, 20 ]

# delete
delete_title 	= "Permanently delete {n} selected file{s}?"
delete_origin	= "center"
delete_offset	= [ 0, 0, 70, 20 ]

# overwrite
overwrite_title   = "Overwrite file?"
overwrite_content = "Will overwrite the following file:"
overwrite_origin  = "center"
overwrite_offset  = [ 0, 0, 50, 15 ]

# quit
quit_title   = "Quit?"
quit_content = "The following tasks are still running, are you sure you want to quit?"
quit_origin  = "center"
quit_offset  = [ 0, 0, 50, 15 ]

[pick]
open_title  = "Open with:"
open_origin = "hovered"
open_offset = [ 0, 1, 50, 7 ]

[which]
sort_by      	 = "none"
sort_sensitive = false
sort_reverse 	 = false
sort_translit  = false
```
