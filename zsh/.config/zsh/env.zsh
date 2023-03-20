export ZDOTDIR="$HOME"
export ZCONFIG_DIR="$HOME/.config/zsh"

if type nvim > /dev/null; then
  alias vim=nvim
  export VISUAL=nvim;
  export EDITOR=nvim;
fi

if type lvim > /dev/null; then
  alias lv=lvim
fi

source "$HOME/.cargo/env"

if [[ "$(uname)" = "Darwin" ]] then
  # Define the environment variable ZPLUG_HOME 
  export ZPLUG_HOME=/opt/homebrew/opt/zplug

  # Homebrew
  export PATH=/usr/local/bin:$PATH
  export PATH="/usr/local/sbin:$PATH"
  # Local bin
  export PATH=$PATH:$HOME/Applications/bin
else 
  export ZPLUG_HOME=$HOME/.zplug
  export TERM=screen-256color
fi

# source "$HOME/.cargo/env"
export PATH=~/.local/bin:$PATH

# export DENO_INSTALL="/home/terenced/.deno"
# export PATH="$DENO_INSTALL/bin:$PATH"
