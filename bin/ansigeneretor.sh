#!/usr/bin/env bash
# by claude
# ansi_time.sh - print the time in big ANSI block letters
#
#   ./ansi_time.sh               current time, once (12-hour)
#   ./ansi_time.sh 24            current time, once (24-hour)
#   ./ansi_time.sh live          live clock, Ctrl+C to quit
#   ./ansi_time.sh live 24       live 24-hour clock
#   ./ansi_time.sh "6:44 PM"     any text made of 0-9 : A P M and spaces
#
# Works on bash 3.2+ (no associative arrays needed).

# --- glyph font: glyph NAME row0 row1 row2 row3 row4 row5 ---------------
glyph() {
    local k="$1" r
    shift
    for r in 0 1 2 3 4 5; do
        printf -v "G_${k}_${r}" '%s' "$1"
        shift
    done
}

glyph 0 " ██████╗ " "██╔═████╗" "██║██╔██║" "████╔╝██║" "╚██████╔╝" " ╚═════╝ "
glyph 1 " ██╗" "███║" "╚██║" " ██║" " ██║" " ╚═╝"
glyph 2 "██████╗ " "╚════██╗" " █████╔╝" "██╔═══╝ " "███████╗" "╚══════╝"
glyph 3 "██████╗ " "╚════██╗" " █████╔╝" " ╚═══██╗" "██████╔╝" "╚═════╝ "
glyph 4 "██╗  ██╗" "██║  ██║" "███████║" "╚════██║" "     ██║" "     ╚═╝"
glyph 5 "███████╗" "██╔════╝" "███████╗" "╚════██║" "███████║" "╚══════╝"
glyph 6 " ██████╗ " "██╔════╝ " "███████╗ " "██╔═══██╗" "╚██████╔╝" " ╚═════╝ "
glyph 7 "███████╗" "╚════██║" "    ██╔╝" "   ██╔╝ " "   ██║  " "   ╚═╝  "
glyph 8 " █████╗ " "██╔══██╗" "╚█████╔╝" "██╔══██╗" "╚█████╔╝" " ╚════╝ "
glyph 9 " █████╗ " "██╔══██╗" "╚██████║" " ╚═══██║" " █████╔╝" " ╚════╝ "
glyph colon "    " "██╗ " "╚═╝ " "██╗ " "╚═╝ " "    "
glyph space "   " "   " "   " "   " "   " "   "
glyph A " █████╗ " "██╔══██╗" "███████║" "██╔══██║" "██║  ██║" "╚═╝  ╚═╝"
glyph P "██████╗ " "██╔══██╗" "██████╔╝" "██╔═══╝ " "██║     " "╚═╝     "
glyph M "███╗   ███╗" "████╗ ████║" "██╔████╔██║" "██║╚██╔╝██║" "██║ ╚═╝ ██║" "╚═╝     ╚═╝"

# top-to-bottom colour gradient (256-colour codes): cyan -> blue
ROW_COLORS=(51 45 39 33 27 21)

# --- render a string in block letters ----------------------------------
render() {
    local str="$1" r i ch k var line
    for r in 0 1 2 3 4 5; do
        line=""
        for ((i = 0; i < ${#str}; i++)); do
            ch="${str:i:1}"
            case "$ch" in
                ":") k=colon ;;
                " ") k=space ;;
                *)   k="$ch" ;;
            esac
            var="G_${k}_${r}"
            line+="${!var}"
        done
        printf '\033[38;5;%sm%s\033[0m\033[K\n' "${ROW_COLORS[r]}" "$line"
    done
}

# --- main ---------------------------------------------------------------
live=0
fmt='%-I:%M %p'
text=""
for a in "$@"; do
    case "$a" in
        live) live=1 ;;
        24)   fmt='%H:%M' ;;
        *)    text="$a" ;;
    esac
done

if [[ -n "$text" ]]; then
    render "$(echo "$text" | tr 'a-z' 'A-Z')"
    exit 0
fi

if [[ $live -eq 1 ]]; then
    tput civis 2>/dev/null
    trap 'tput cnorm 2>/dev/null; clear; exit 0' INT TERM
    clear
    while true; do
        printf '\033[H\n'
        render "$(date +"$fmt")"
        sleep 1
    done
else
    render "$(date +"$fmt")"
fi