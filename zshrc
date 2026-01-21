export PATH="$HOME/.local/bin:$PATH"

# fnm
FNM_PATH="/Users/peterchinman/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/peterchinman/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# bun completions
[ -s "/Users/peterchinman/.bun/_bun" ] && source "/Users/peterchinman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
autoload -Uz compinit && compinit
zstyle ':completion:*:*:git:*' matcher-list 'm:{a-z}={A-Z}'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Load functions
if [ -f ~/.functions ]; then
    source ~/.functions
fi

[ -f "/Users/peterchinman/.ghcup/env" ] && . "/Users/peterchinman/.ghcup/env" # ghcup-env

. "$HOME/.atuin/bin/env"
. "$HOME/.config/z.sh"

eval "$(atuin init zsh)"
eval "$(starship init zsh)"
export GPG_TTY=$(tty)
