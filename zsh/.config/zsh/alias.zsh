# ls/exa aliasa
if type exa > /dev/null; then
  alias ls='exa --classify --group-directories-first'
  alias lx='exa --oneline --classify --all --group-directories-first'
  alias ll='exa --long --classify --all --group-directories-first'
  alias lxt='exa --icons --tree --level'
  alias lxt2='exa --icons --tree --level 2'
fi

alias cd..="cd .."
# git
alias gko="gco"
alias gkob="gco -b"
alias gbclean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gll="git log --pretty='%C(yellow)%h %C(cyan)%ad %Cblue%aN%C(auto)%d %Creset%s' --date=relative --date-order --graph"

# vim
alias vim.="vim ."

if type batcat > /dev/null; then
  alias bcat=batcat
fi

# Docker
if type docker > /dev/null; then
  alias din='docker images -f "dangling=true"'
  alias drmin='docker rmi -f $(docker images -f "dangling=true" -q)'
  alias drv='docker volume rm $(docker volume ls -qf dangling=true)'
  alias dcp='docker-compose'
  alias dcpu='docker-compose up'
  alias dcpr='docker-compose run'
  alias dcprbash='docker-compose run --entrypoint bash'
  alias dcpb='docker-compose build'
fi

# ZSH
alias zc="code $ZCONFIG_DIR"
alias zcv="vim $ZCONFIG_DIR"
alias zr="RELOAD=1 source $HOME/.zshrc"
alias allconfigs="code $HOME/.config/"

# Misc
alias weatherto='curl wttr.in/toronto'
alias weatherrh='curl wttr.in/richmond+hill'

if type thefuck > /dev/null; then
  eval $(thefuck --alias)
fi

# npm
alias nr='npm run'
