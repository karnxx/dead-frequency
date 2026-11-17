#!/usr/bin/env python3
"""img2ansi.py - turn an image into ANSI art you can `cat` in bash.

Each character is two vertical pixels (the half-block trick), so the
picture keeps its proportions. Transparent PNG areas stay see-through.

  python3 img2ansi.py phone.png                    # print to terminal
  python3 img2ansi.py phone.png -w 30 -o phone.ans # save for your game
  python3 img2ansi.py phone.png --mode 256         # older terminals

Then in bash:   cat phone.ans
Needs: pip install pillow
by claude
"""
import argparse
import sys

from PIL import Image

RESET = "\x1b[0m"


def rgb_to_256(r, g, b):
    """Nearest xterm-256 colour (6x6x6 cube or the grey ramp)."""
    if abs(r - g) < 10 and abs(g - b) < 10:  # near grey -> grey ramp
        grey = (r + g + b) // 3
        if grey < 8:
            return 16
        if grey > 248:
            return 231
        return 232 + round((grey - 8) / 247 * 23)
    cube = lambda v: round(v / 255 * 5)
    return 16 + 36 * cube(r) + 6 * cube(g) + cube(b)


def make_color_fn(mode):
    if mode == "256":
        fg = lambda p: f"\x1b[38;5;{rgb_to_256(*p[:3])}m"
        return fg
    return lambda p: f"\x1b[38;2;{p[0]};{p[1]};{p[2]}m"


def make_bg_fn(mode):
    if mode == "256":
        return lambda p: f"\x1b[48;5;{rgb_to_256(*p[:3])}m"
    return lambda p: f"\x1b[48;2;{p[0]};{p[1]};{p[2]}m"


def convert(img, width, mode="truecolor", alpha_cut=128):
    img = img.convert("RGBA")
    w, h = img.size
    new_h = max(2, round(h * width / w))
    if new_h % 2:
        new_h += 1  # two pixel-rows per character row
    img = img.resize((width, new_h), Image.LANCZOS)
    px = img.load()
    fg, bg = make_color_fn(mode), make_bg_fn(mode)

    lines = []
    for y in range(0, new_h, 2):
        row = []
        for x in range(width):
            top, bot = px[x, y], px[x, y + 1]
            top_on, bot_on = top[3] >= alpha_cut, bot[3] >= alpha_cut
            if top_on and bot_on:
                row.append(fg(top) + bg(bot) + "▀")
            elif top_on:
                row.append(RESET + fg(top) + "▀")
            elif bot_on:
                row.append(RESET + fg(bot) + "▄")
            else:
                row.append(RESET + " ")
        lines.append("".join(row) + RESET)
    return lines


def main():
    ap = argparse.ArgumentParser(description="Convert an image to ANSI art.")
    ap.add_argument("image", help="path to a PNG/JPG/GIF/etc.")
    ap.add_argument("-w", "--width", type=int, default=40,
                    help="width in characters (default 40)")
    ap.add_argument("--mode", choices=["truecolor", "256"], default="truecolor",
                    help="colour depth (default truecolor)")
    ap.add_argument("--alpha", type=int, default=128,
                    help="alpha cutoff 0-255 for transparency (default 128)")
    ap.add_argument("-o", "--out", help="write to this file instead of printing")
    args = ap.parse_args()

    try:
        img = Image.open(args.image)
    except Exception as e:
        sys.exit(f"Could not open {args.image}: {e}")

    lines = convert(img, args.width, args.mode, args.alpha)
    text = "\n".join(lines) + "\n"

    if args.out:
        with open(args.out, "w", encoding="utf-8") as f:
            f.write(text)
        print(f"wrote {args.out} ({args.width} cols x {len(lines)} rows)")
    else:
        sys.stdout.write(text)


if __name__ == "__main__":
    main()