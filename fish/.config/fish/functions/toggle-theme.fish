function toggle-theme --description 'Toggle light/dark mode and apply matching Ghostty theme'
    set -l mode_file $HOME/.config/colormode

    set -l current dark
    if test -f $mode_file
        set current (string trim <$mode_file)
    end

    set -l next
    switch $current
        case light
            set next dark
        case '*'
            set next light
    end

    echo $next >$mode_file

    switch $next
        case light
            ghostty-theme Catppuccin Latte
        case dark
            ghostty-theme Catppuccin Mocha
    end
end
