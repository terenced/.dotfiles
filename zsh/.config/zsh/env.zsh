if [[ "$(uname)" = "Darwin" ]] then
  # Define the environment variable ZPLUG_HOME 
  export ZPLUG_HOME=/usr/local/opt/zplug

  # Homebrew
  export PATH=/usr/local/bin:$PATH
  export PATH="/usr/local/sbin:$PATH"
  # Local bin
  export PATH=$PATH:$HOME/Applications/bin
else 
  export ZPLUG_HOME=$HOME/.zplug
  export TERM=screen-256color
fi

source "$HOME/.cargo/env"
export PATH=~/.local/bin:$PATH
