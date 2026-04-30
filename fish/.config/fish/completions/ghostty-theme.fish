complete -c ghostty-theme -f -a "(ghostty +list-themes 2>/dev/null | string replace -r ' \\(.*\\)\$' '')"
