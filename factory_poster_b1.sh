#!/usr/bin/env sh

# Poster - B1 size
# https://factory.pixiv.net/products/fast_poster
# -----------------------------
# image size      : 734 x 1036 mm (10115 x 14276 px recommended)
# circle size     : 81.56 mm
# circle count    : 9 (per 724mm)    *724mm = 734mm - margin(5mm x 2)
# repeatable unit : (10115 * (724/734) / 9) x 2 = 2217 px
# -----------------------------

RESFILE=resources/mm47-3_unit.svg
PRODUCT=mm47-3_poster_b1
UNITSIZE=2217
TEMPSIZE=$(( $UNITSIZE * 3 ))
IMGH=14276 ; REPTY=8
IMGW=10115 ; REPTX=6

convert -density 1200 -resize ${TEMPSIZE}x${TEMPSIZE} -fuzz 10% -trim $RESFILE $PRODUCT-temp.png
convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $PRODUCT-temp.png $PRODUCT-temp_.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-temp_.png --output $PRODUCT-unit.png
convert -append `seq 1 $REPTY | awk '{printf "'$PRODUCT'-unit.png "}'` $PRODUCT-line.png
convert +append `seq 1 $REPTX | awk '{printf "'$PRODUCT'-line.png "}'` $PRODUCT-rect.png
convert -gravity center -crop ${IMGW}x${IMGH}+0+0 $PRODUCT-rect.png $PRODUCT-full.png ; pngquant --force --speed 1 --nofs --strip $PRODUCT-full.png --output images-dist/$PRODUCT.png
rm -f $PRODUCT-*.png
