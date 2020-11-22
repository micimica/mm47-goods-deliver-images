#!/usr/bin/env sh

# Common Use - A4 size
# -----------------------------
# image size      : 297 x 210 mm (4093 x 2894 px recommended)
# circle size     : 42 mm
# circle count    : 10 (per 420mm)
# repeatable unit : (5787 / 5) x 2 = 2315 px
# -----------------------------

UNITSIZE=2315
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim resources/mm47-2_unit.svg mm47_a4_unit_temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} mm47_a4_unit_temp.png mm47_a4_unit.png
convert -append `seq 1 3 | awk '{printf "mm47_a4_unit.png "}'` mm47_a4_line.png
convert +append `seq 1 4 | awk '{printf "mm47_a4_line.png "}'` mm47_a4_rect.png
convert -gravity center -crop 4093x2894+0+0 mm47_a4_rect.png images-dist/mm47_a4.png
rm -f mm47_a4_*.png
