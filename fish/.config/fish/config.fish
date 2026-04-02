if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin/

set -U fish_greeting

alias .. "cd .."
alias "cd.." "cd .."
alias ij="open -na \"IntelliJ IDEA.app\" --args $argv"
alias refish="source ~/.config/fish/config.fish"
alias fgbd="git branch | fzf -m | cut -c 3- | xargs git branch -D"
alias brewup="brew outdated|sort -r | fzf -m | string join ' ' -- | xargs brew upgrade"

if test -f $__fish_config_dir/apps.fish
    source $__fish_config_dir/apps.fish
end

if test -f $__fish_config_dir/work.fish
    source $__fish_config_dir/work.fish
end

# uv
fish_add_path "/Users/terrydellino/.local/bin"

# pnpm
set -gx PNPM_HOME /Users/terrydellino/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
