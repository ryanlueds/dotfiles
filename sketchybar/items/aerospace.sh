#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    if [ "$first" = false ]; then
        sketchybar --add item spacer_$sid left \
            --set spacer_$sid width=10 \
            background.drawing=off \
            icon.drawing=off \
            label.drawing=off
    fi
    first=false

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color="$BAR_COLOR" \
        background.height=26 \
        background.corner_radius="$CORNER_RADIUS" \
        background.border_width="$BORDER_WIDTH" \
        background.drawing=on \
        width=26 \
        label.drawing=on \
        icon.drawing=off \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Under here, looks like:
# ( ) ( ) ( ) ( ) ( )  > ( Ghostty )

sketchybar --add item separator left \
	--set separator icon= \
	icon.font="$FONT:Regular:16.0" \
	background.padding_left=10 \
	background.padding_right=10 \
	label.drawing=off \
	associated_display=active \
	icon.color="$BLUE"
