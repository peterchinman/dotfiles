export PATH="$HOME/.local/bin:$PATH"

# fnm
FNM_PATH="$HOME/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
autoload -Uz compinit && compinit
zstyle ':completion:*:*:git:*' matcher-list 'm:{a-z}={A-Z}'

# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Load functions
if [ -f ~/.functions ]; then
    source ~/.functions
fi

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

. "$HOME/.atuin/bin/env"
. "$HOME/.config/z.sh"

eval "$(atuin init zsh)"
eval "$(starship init zsh)"
export GPG_TTY=$(tty)
