#!/bin/sh
set -euo pipefail
image='/tmp/screenshot.png'
scrot -s $image
xclip -selection clipboard -target image/png -i $image
rm $image
