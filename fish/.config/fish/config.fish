if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin/

set -U fish_greeting

alias .. "cd .."
alias "cd.." "cd .."
alias ij="open -na \"IntelliJ IDEA.app\" --args $argv"
alias refish="source ~/.config/fish/config.fish"

if test -f work.fish
    source work.fish
end

if test -f apps.fish
    source apps.fish
end
