#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$1 background.border_color=0xfff7768e
else
    sketchybar --set space.$1 background.border_color=0xffa9b1d6
fi
