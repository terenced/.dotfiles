source $HOME/.config/zsh/env.zsh
###########################################################
# Pre configuration
# Loads zplug
source $ZPLUG_HOME/init.zsh

###########################################################
# Packages
# From oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/python", from:oh-my-zsh
zplug "plugins/zoxide", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
# zplug "catppuccin/zsh-syntax-highlighting", from:github, as:plugin

# Rust
# source $HOME/.cargo/env

# --------------- Source ZCONFIG_DIR files... --------------- #
# Files to source ~/.config/zsh/*.zsh
for config in $ZCONFIG_DIR/**/*(.); do
  if [[ "$config" != *env* ]] && [[ "$config" != *powerline* ]]  && [[ "$config" != *powerline* ]]; then
    source $config
  fi
done

# source /Users/tdellino/Library/Preferences/org.dystroy.broot/launcher/bash/br
zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Will need to generate it via  /opt/homebrew/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH="/home/terry/.local/share/fnm:$PATH"
export PATH=/Users/tdellino/.fnm:$PATH
if type fnm > /dev/null; then
  eval "$(fnm env)"
fi


export fpath=(/usr/local/opt/fnm/share/zsh/site-functions $fpath)

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^r' _atuin_search_widget

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/terrydellino/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
export PATH=/usr/local/opt/postgresql@14/bin:$PATH
eval "$(rbenv init -)"


# bun completions
[ -s "/Users/terrydellino/.bun/_bun" ] && source "/Users/terrydellino/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

