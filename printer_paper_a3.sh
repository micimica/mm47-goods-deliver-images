#!/usr/bin/env sh

# Common Use - A3 size  (usable for A2 - A4)
# -----------------------------
# image size      : 420 x 297 mm (5787 x 4093 px recommended)  A3
# circle size     : 11.67 mm
# circle count    : 36 (per 420mm)
# repeatable unit : (5787 / 36) x 2 = 322 px
# -----------------------------

UNITSIZE=322
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim resources/mm47-1_unit.svg mm47_a3_unit_temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} mm47_a3_unit_temp.png mm47_a3_unit.png
convert -append `seq 1 15 | awk '{printf "mm47_a3_unit.png "}'` mm47_a3_line.png
convert +append `seq 1 20 | awk '{printf "mm47_a3_line.png "}'` mm47_a3_rect.png
convert -gravity center -crop 5787x4093+0+0 mm47_a3_rect.png images-dist/mm47_a3.png
rm -f mm47_a3_*.png
