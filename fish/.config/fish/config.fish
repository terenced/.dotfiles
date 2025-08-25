if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin/

set -U fish_greeting

if type -q atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source

    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

if type -q starship
    #starship init fish | source
end

if type -q eza
    alias ls "eza --icons --group-directories-first"
    alias lsa "eza --all --icons --group-directories-first"
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

if type -q nvim
    set -gx EDITOR nvim
    alias v nvim
end

alias .. "cd .."
alias "cd.." "cd .."

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
