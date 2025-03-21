![bsc7th-neovim](assets/bsc7th-neovim.jpg)

# bsc7th's dotfiles

Most of my plugins come from [Folke's](https://github.com/folke) Neovim config, with a few others from talented developers at Neovim Spectrum. My workflow is inspired by [Josean Martinez's](https://github.com/josean-dev) and [Takuya Matsuyama](https://github.com/craftzdog), also known as [craftzdog](https://github.com/craftzdog) or [devaslife](https://www.youtube.com/results?search_query=devaslife) on YouTube. You can also use the Neovim website as a guide, as it provides detailed information on each repository, helping you better understand how things work.

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

I use [Takuya Matsuyama](https://github.com/craftzdog) tmux custom theme and [Josean Martinez's](https://github.com/josean-dev?tab=repositories) config.

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
