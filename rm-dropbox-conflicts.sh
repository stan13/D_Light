find | grep -iE " \([^)]* conflicted copy [^)]*\)" | while read line; do rm "$line"; done
