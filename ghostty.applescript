tell application "System Events"
  tell process "ghostty"
    set frontmost to true
    delay 0.1
    keystroke "," using {command down, shift down}
  end tell
end tell
