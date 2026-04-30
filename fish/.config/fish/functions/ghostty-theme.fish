function ghostty-theme --description 'Get/set Ghostty theme via auto/theme.ghostty'
    set -l theme_file $HOME/.config/ghostty/auto/theme.ghostty

    if test (count $argv) -eq 0
        test -f $theme_file; and cat $theme_file
        return 0
    end

    set -l name (string join ' ' $argv)
    echo "theme = $name" >$theme_file

    osascript \
        -e 'if application "Ghostty" is running then' \
        -e '  tell application "System Events"' \
        -e '    tell process "ghostty"' \
        -e '      set frontmost to true' \
        -e '      delay 0.1' \
        -e '      keystroke "," using {command down, shift down}' \
        -e '    end tell' \
        -e '  end tell' \
        -e 'end if'
end
