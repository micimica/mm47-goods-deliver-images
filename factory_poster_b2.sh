#!/usr/bin/env sh

# Poster - B2 size
# https://factory.pixiv.net/products/fast_poster
# -----------------------------
# image size      : 521 x 734 mm (7180 x 10115 px recommended)
# circle size     : 20.4 mm
# circle count    : 36 (per 734mm)
# repeatable unit : (10115 / 36) x 2 = 562 px
# -----------------------------

UNITSIZE=562
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim resources/mm47-1_unit.svg mm47_poster_b2_unit_temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} mm47_poster_b2_unit_temp.png mm47_poster_b2_unit.png
convert -append `seq 1 20 | awk '{printf "mm47_poster_b2_unit.png "}'` mm47_poster_b2_line.png
convert +append `seq 1 14 | awk '{printf "mm47_poster_b2_line.png "}'` mm47_poster_b2_rect.png
convert -gravity center -crop 7180x10115+0+0 mm47_poster_b2_rect.png images-dist/mm47_poster_b2.png
rm -f mm47_poster_b2_*.png
