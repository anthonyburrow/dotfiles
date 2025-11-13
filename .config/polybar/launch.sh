#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

monitors=($(polybar --list-monitors | cut -d: -f1))
bars=("main" "secondary")

for i in "${!monitors[@]}"; do
    monitor=${monitors[$i]}
    bar=${bars[$i]:-main}
    MONITOR=$monitor polybar --reload "$bar" &
done

echo "Bar launched..."
