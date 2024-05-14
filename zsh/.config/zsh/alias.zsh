# ls/eza aliasa
if type eza > /dev/null; then
  alias ls='eza --classify --group-directories-first --icons'
  alias lx='eza --oneline --classify --all --group-directories-first --icons'
  alias ll='eza --classify --all --group-directories-first --icons'
  alias lll='ll -1 --icons'
  alias lxt='eza --icons --tree --level'
  alias lxt2='eza --icons --tree --level 2'
fi

alias cd..="cd .."
alias cl="clear"
# git
alias gko="gco"
alias gkob="gco -b"
alias gbclean='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias gbclean-hard='git branch | egrep -v "(^\*|master|main|dev)" | xargs git branch -D'
alias gll="git log --pretty='%C(yellow)%h %C(cyan)%ad %Cblue%aN%C(auto)%d %Creset%s' --date=relative --date-order --graph"
alias gls="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias lg='lazygit'

# vim
alias vim.="vim ."
alias v="vim"
alias c="code"
alias c.="code ."


alias j="z"

if type batcat > /dev/null; then
  alias bcat=batcat
fi

if type act > /dev/null; then
  alias actt="act --container-architecture linux/amd64"
fi
# ripgrep
# TODO: rg --json EXPRESSION PATH | delta
#
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

if type lazydocker > /dev/null; then
  alias lzd='lazydocker'
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

alias pn="pnpm"
alias pnx="pnpm exec"

