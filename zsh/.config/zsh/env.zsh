export ZDOTDIR="$HOME"
export ZCONFIG_DIR="$HOME/.config/zsh"

if type nvim > /dev/null; then
  alias vim=nvim
  export VISUAL=nvim;
  export EDITOR=nvim;
fi

# source "$HOME/.cargo/env"

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

export FZF_DEFAULT_OPTS=" \
--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1 \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

if [ -n "$TMUX" ]; then
  export TERM="tmux-256color"
else
  export TERM="xterm-256color"
fi

export HISTIGNORE="ls:ll:lll:cd:pwd:exit:cl:clear:history:fg:bg:jobs:gl:gll"
export XDG_CONFIG_HOME="$HOME/.config"
