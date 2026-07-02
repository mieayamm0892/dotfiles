#!/bin/bash

STATE_FILE="$HOME/.cache/ac_state"

# loop terus
while true; do
    AC=$(cat /sys/class/power_supply/ACAD/online 2>/dev/null || echo "0")
    
    # ambil state lama (kalau belum ada, set -1)
    PREV=$(cat "$STATE_FILE" 2>/dev/null || echo "-1")
    
    # kalau sama, skip
    if [ "$AC" != "$PREV" ]; then
        # simpan state baru
        echo "$AC" > "$STATE_FILE"

        # bunyikan sesuai kondisi
        if [ "$AC" = "1" ]; then
            pw-play ah.mp3
        else
            pw-play ah.mp3
        fi
    fi
    
    sleep 1  # cek tiap 1 detik
done

