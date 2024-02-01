export PATH="$HOME/bin:$PATH"

# Load Zsh plugins
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Vim mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Initialize completion system
autoload -Uz compinit && compinit
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_STRATEGY=(history)

# Other configurations
eval "$(rtx activate zsh)"
eval "$(starship init zsh)"
