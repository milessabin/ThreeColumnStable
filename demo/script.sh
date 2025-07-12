ID=$(xdotool search --name Xephyr)

# Set up terminals
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Return
sleep 0.5
xdotool type --window ${ID} One
sleep 2
xdotool key --window ${ID} Shift_L+Super_L+Return
sleep 0.5
xdotool type --window ${ID} Two
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Return
sleep 0.5
xdotool type --window ${ID} Three
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Return
sleep 0.5
xdotool type --window ${ID} Four

# Move column left
sleep 2
xdotool key --window ${ID} Control_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Control_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Control_L+Super_L+Left

# Move column right
sleep 2
xdotool key --window ${ID} Control_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Control_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Control_L+Super_L+Right

# Move window left
sleep 2
xdotool key --window ${ID} Shift_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Left

# Move window right
sleep 2
xdotool key --window ${ID} Shift_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Shift_L+Super_L+Right

# Rotate columns left
sleep 2
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Left
sleep 1
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Left

# Rotate columns right
sleep 2
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Right
sleep 1
xdotool key --window ${ID} Shift_L+Control_L+Super_L+Right

# Close central window
sleep 2
xdotool key --window ${ID} Super_L+Left
sleep 1
xdotool key --window ${ID} Control_L+u
xdotool key --window ${ID} Control_L+d

# Move right column to centre
sleep 2
xdotool key --window ${ID} Control_L+Super_L+Left

# Move centre column to right
sleep 2
xdotool key --window ${ID} Control_L+Super_L+Right

# Move left column to centre
sleep 2
xdotool key --window ${ID} Super_L+Left
sleep 1
xdotool key --window ${ID} Control_L+Super_L+Right

# Move centre column to left
sleep 2
xdotool key --window ${ID} Control_L+Super_L+Left

# Tidy columns
sleep 2
xdotool key --window ${ID} Control_L+Super_L+space

# Close centre window
sleep 2
xdotool key --window ${ID} Control_L+u
xdotool key --window ${ID} Control_L+d

# Close top right window bringing remaing window to centre
sleep 3
xdotool key --window ${ID} Control_L+u
xdotool key --window ${ID} Control_L+d

# Close last window
sleep 3
xdotool key --window ${ID} Control_L+u
xdotool key --window ${ID} Control_L+d
