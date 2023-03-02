#!/bin/bash

TMP=/tmp
HOVER_IMG=${HOME}/.config/i3/assets/on-image5.png

# Assets images
# ---
# kali-actiniaria-16x9.png
# on-image1.png
# on-image2.png
# on-image3.png
# on-image4.png
# on-image5.png
# on-image6.png
# on-image7.png
# on-image8.png
# on-image9.png
# on-image10.png

revert() {
  xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 5 5 5

rm ${TMP}/lockScreen.png 2>/dev/null
scrot -b ${TMP}/lockScreen.png && \
convert -scale 10% -blur 0x3 -resize 1000% ${TMP}/lockScreen.png ${TMP}/blurred.png
composite -gravity center ${HOVER_IMG} ${TMP}/blurred.png ${TMP}/lockScreen.png && \
rm ${TMP}/blurred.png 

i3lock -e -f -i ${TMP}/lockScreen.png &&  echo "mem" > /sys/power/state
revert

