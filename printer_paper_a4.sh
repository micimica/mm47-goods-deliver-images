#!/usr/bin/env sh

# Common Use - A4 size
# -----------------------------
# image size      : 297 x 210 mm (4093 x 2894 px recommended)
# circle size     : 70 mm
# circle count    : 3 (per 210mm)
# repeatable unit : (2894 / 3) x 2 = 1930 px
# -----------------------------

RESFILE=resources/mm47-3_unit.svg
PRODUCT=mm47-3_a4
IMGH=4093 ; REPTY=4
IMGW=2894 ; REPTX=4
UNITSIZE=1930
TEMPSIZE=$(( $UNITSIZE * 3 ))

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim $RESFILE $PRODUCT-temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $PRODUCT-temp.png $PRODUCT-temp_.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-temp_.png --output $PRODUCT-unit.png
convert -append `seq 1 $REPTY | awk '{printf "'$PRODUCT'-unit.png "}'` $PRODUCT-line.png
convert +append `seq 1 $REPTX | awk '{printf "'$PRODUCT'-line.png "}'` $PRODUCT-rect.png
convert -gravity center -crop ${IMGW}x${IMGH}+0+0 $PRODUCT-rect.png $PRODUCT-full.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-full.png --output images-dist/$PRODUCT.png
rm -f $PRODUCT-*.png
