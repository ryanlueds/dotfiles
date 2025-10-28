#!/bin/zsh
# Accepts pane path as argument
DIR="$1"
cd "$DIR" || exit 0

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # Branch or short commit
    branch=$(git symbolic-ref --quiet --short HEAD || git rev-parse --short HEAD || echo unknown)
    printf ' #[fg=#{@gruber_mauve}]⎇ %s' "$branch"

    # Get all diff info in one shot for unstaged + staged
    diff_output=$(git diff --numstat 2>/dev/null)
    diff_cached=$(git diff --cached --numstat 2>/dev/null)

    # Counts
    unstaged_files=$(echo "$diff_output" | wc -l | tr -d ' ')
    staged_files=$(echo "$diff_cached" | wc -l | tr -d ' ')
    total_modified=$((unstaged_files + staged_files))

    insertions=$(echo "$diff_output" "$diff_cached" | awk '{sum+=$1} END{print sum+0}')
    deletions=$(echo "$diff_output" "$diff_cached" | awk '{sum+=$2} END{print sum+0}')

    # Only print stats if there are any changes
    if (( insertions > 0 || deletions > 0 || total_modified > 0 )); then
        printf ' #[fg=#{@gruber_fg_dim}]│'
        (( insertions > 0 )) && printf ' #[fg=#{@gruber_green}]+%d' $insertions
        (( deletions > 0 )) && printf ' #[fg=#{@gruber_red}]-%d' $deletions
        (( total_modified > 0 )) && printf ' #[fg=#{@gruber_yellow}]~%d' $total_modified
    fi
else
    printf ' #[fg=#{@gruber_fg_dim}]no git'
fi

printf ' #[fg=#{@gruber_fg_dim}]│ ᓚᘏᗢ  ...'
