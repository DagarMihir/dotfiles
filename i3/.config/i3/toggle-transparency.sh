#!/bin/bash
WIN=$(xdotool getactivewindow)

# Check if property is already set
if xprop -id "$WIN" | grep -q "_PICOM_NO_BLUR"; then
    # Remove property → restore normal blur + transparency
    xprop -id "$WIN" -remove _PICOM_NO_BLUR
else
    # Set property → disable blur + force opaque
    xprop -id "$WIN" -f _PICOM_NO_BLUR 32c -set _PICOM_NO_BLUR 1
fi

