#!/bin/bash
# Polybar CAVA visualizer — clean, white, evenly spaced wave style

CONFIG="$HOME/.config/polybar/cava_polybar_config"
CAVA_FIFO="/tmp/cava.fifo"

# Create FIFO if missing
if [ ! -f "$CAVA_FIFO" ]; then
    mkfifo "$CAVA_FIFO"
fi

# Run cava if not already running
if ! pgrep -x cava >/dev/null; then
    cava -p "$CONFIG" > "$CAVA_FIFO" &
    sleep 0.2
fi

# Read cava output continuously
while read -r line; do
    bars=( $(echo "$line" | tr ';' ' ') )
    output=""

    for i in "${!bars[@]}"; do
        # Scale to a small height (fits Polybar)
        level=$(( (bars[i] * 6) / 100 ))

        # Convert level to block characters
        case $level in
            0) char=" " ;;
            1) char="▁" ;;
            2) char="▂" ;;
            3) char="▃" ;;
            4) char="▄" ;;
            5) char="▅" ;;
            6) char="▆" ;;
            *) char="▆" ;;
        esac

        # Add spacing for wavy aesthetic
        output+="${char}"
    done

    # Print with white color
    echo "%{F#AAFFFFFF}${output}%{F-}"
done < "$CAVA_FIFO"

