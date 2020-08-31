#!/bin/sh
set -euo pipefail
image='/tmp/screenshot.png'
scrot $image
xclip -selection clipboard -target image/png -i $image
rm $image
