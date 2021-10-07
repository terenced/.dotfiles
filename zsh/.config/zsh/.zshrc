# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###########################################################
# Pre configuration
export ZDOTDIR=$HOME/.config/zsh
source "$ZDOTDIR/env.zsh"

# Loads zplug
source $ZPLUG_HOME/init.zsh

###########################################################
# Packages
# From oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# Node
N_DEFAULT=v14

# Rust
source $HOME/.cargo/env

# --------------- Source ZDOTDIR files... --------------- #
# Files to source
# ~/.config/zsh/*.zsh
for config ($ZDOTDIR/**/*.zsh) 
do
if [[ "$config" != *env* ]] && [[ "$config" != *powerline* ]]; then
  source $config
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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 
# fnm
if type fnm > /dev/null; then
  export PATH=/Users/tdellino/.fnm:$PATH
  eval "$(fnm env)"
fi


export fpath=(/usr/local/opt/fnm/share/zsh/site-functions $fpath)

export DENO_INSTALL="/home/terenced/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
