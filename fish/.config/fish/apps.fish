if type -q atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source

    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

if type -q direnv
    eval (direnv hook fish)
end

if type -q starship
    starship init fish | source
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

if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
    if not test -f ~/.config/fish/completions/mise.fish
        mise completion fish >~/.config/fish/completions/mise.fish
    end
end

if type -q lazygit
    alias lg lazygit
end

if type -q pnpm
    alias pn pnpm
    set -gx PNPM_HOME $HOME/Library/pnpm
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
end
