#!/usr/bin/env sh

# Common Use - A3 size
# -----------------------------
# image size      : 420 x 297 mm (5787 x 4093 px recommended)
# circle size     : 70 mm
# circle count    : 6 (per 420mm)
# repeatable unit : (5787 / 6) x 2 = 1930 px
# -----------------------------

RESFILE=resources/mm47-3_unit.svg
PRODUCT=mm47-3_a3
IMGH=5787 ; REPTY=4
IMGW=4093 ; REPTX=4
UNITSIZE=1930
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim $RESFILE $PRODUCT-temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $PRODUCT-temp.png $PRODUCT-temp_.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-temp_.png --output $PRODUCT-unit.png
convert -append `seq 1 $REPTY | awk '{printf "'$PRODUCT'-unit.png "}'` $PRODUCT-line.png
convert +append `seq 1 $REPTX | awk '{printf "'$PRODUCT'-line.png "}'` $PRODUCT-rect.png
convert -gravity center -crop ${IMGW}x${IMGH}+0+0 $PRODUCT-rect.png $PRODUCT-full.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-full.png --output images-dist/$PRODUCT.png
rm -f $PRODUCT-*.png
