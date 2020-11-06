#!/usr/bin/env sh

# Poster - B1 size
# https://factory.pixiv.net/products/fast_poster
# -----------------------------
# image size      : 734 x 1036 mm (10115 x 14276 px recommended)
# circle size     : 20.4 mm
# circle count    : 36 (per 734mm)
# repeatable unit : (10115 / 36) x 2 = 562 px
# -----------------------------

UNITSIZE=562
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim resources/mm47-1_unit.svg mm47_poster_b1_unit_temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} mm47_poster_b1_unit_temp.png mm47_poster_b1_unit.png
convert +append `seq 1 20 | awk '{printf "mm47_poster_b1_unit.png "}'` mm47_poster_b1_line.png
convert -append `seq 1 28 | awk '{printf "mm47_poster_b1_line.png "}'` mm47_poster_b1_rect.png
convert -gravity center -crop 10115x14276+0+0 mm47_poster_b1_rect.png images-dist/mm47_poster_b1.png
rm -f mm47_poster_b1_*.png
