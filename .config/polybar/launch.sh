#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

monitors=($(polybar --list-monitors | cut -d: -f1))
bars=("main" "secondary")

for i in "${!monitors[@]}"; do
    monitor=${monitors[$i]}
    bar=${bars[$i]:-main}
    MONITOR=$monitor polybar --reload "$bar" &
done

echo "Bar launched..."
