# 🧐 If the instant prompt exists, we load it! (aka the magical zsh prompt powers!)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"  # ⚡ Power up with instant prompt!
fi

# 🚀 Load the Powerlevel10k theme (aka the snazzy terminal theme)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# ✨ Add autosuggestions because typing is overrated
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 🎨 Syntax highlighting – because we like colors that make us feel fancy
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 🔧 "y" function: navigate to cool directories like a wizard
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd  # 🧙‍♂️ Temporary file magic for cwd
  yazi "$@" --cwd-file="$tmp"  # ⚡ Call Yazi to get that CWD
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"  # 🏃‍♂️ Jump to the new directory if we have one
  fi
  rm -f -- "$tmp"  # 🧹 Clean up like a true digital janitor
}

# 🌈 "ls" alias, but with extra sparkle thanks to eza!
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"  # ✨ "ls" with icons and no boring details!

# 🎉 Zoxide for smarter directory navigation (don't just cd, ZOXIDE!)
eval "$(zoxide init zsh)"  # 🔥 Initialize Zoxide

# 📚 Set the default bat theme for syntax highlighting (keep it colorful)
export BAT_THEME=ansi

# 🌍 Show file or directory preview – see what's inside before opening it
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"  # 👀 See what's up before diving in!

# 🧠 Customize FZF for previewing files (because we all need better search)
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"  # 🔍 Fuzzy file search with preview
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"  # 🔍 Fuzzy dir search with preview

# 🚀 Custom function for FZF commands with dynamic preview options
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;  # 🌳 Fuzzy cd with a tree preview
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;  # 💡 Fuzzy export/unset with a preview
    ssh)          fzf --preview 'dig {}'                   "$@" ;;  # 🖥 Fuzzy SSH with a DNS preview
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;  # 🔍 Default fuzzy search preview
  esac
}

# 💻 Default FZF command: Find files quickly (fd is our friend)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"  # 🏃‍♂️ Find files (but no .git folders)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"  # 🔥 Search all the things!
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"  # 🔍 Fuzzy dir search

# 💨 Path completion with fzf – because who needs to type all that?
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"  # 🔑 Find paths faster!
}

# 📂 Directory completion with fzf – find the right dir in a snap!
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"  # 🏙️ Explore directories quickly!
}

# 🚀 Fuzzy-finding magic for zsh
eval "$(fzf --zsh)"  # ✨ Enable fzf integration with zsh

# 📦 Powerlevel10k config file, loading if it exists (gotta keep it looking good)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh  # 🔥 Load the Powerlevel10k config if we have it
