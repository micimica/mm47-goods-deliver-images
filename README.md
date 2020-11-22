# mm47 goods images generator

This is a generator for images to make "Mici-mica version 47" goods by pixivFACTORY.

- The Amulet "Mici-mica" for Energy Works
  - https://micimica-distribution.tumblr.com/
- pixivFACTORY
  - https://factory.pixiv.net/
- micimica shop
  - https://micimica.booth.pm/

## Requirement

- docker
  - https://docs.docker.com/docker-for-windows/
  - https://docs.docker.com/docker-for-mac/

## Usage

### Prepare

```sh
# If you use Docker Toolbox for Windows, you can mount the "c:\Users\" subdirectories to docker by default. 
cd /c/Users/$USERNAME/

git clone https://github.com/micimica/mm47-goods-deliver-images.git
cd mm47-goods-deliver-images
docker build -t micimica/imagemagick:latest .
```

### Generate
```sh
cd /c/Users/$USERNAME/mm47-goods-deliver-images

docker run --rm -it --name micimica-imagemagick -v `pwd`:/mm47-goods-deliver-images micimica/imagemagick:latest

cd /mm47-goods-deliver-images

chmod u+x *.sh

./factory_poster_b1.sh
./factory_poster_b2.sh

./printer_paper_a3.sh

chmod 777 images-dist/*.png
exit

docker stop micimica-imagemagick
```

### Clean Up

```sh
docker image rm -f $(docker image ls -q -f reference=micimica/imagemagick:latest)
# docker image rm -f $(docker image ls -q -f reference=alpine:latest)
# docker container prune -f
```

## Reference of Goods / Image
| Goods Variation | Image File | Example |
|:---|:---|:---|
| [Poster - B1 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm47_poster_b1.png | [link](https://micimica.booth.pm/items/2507569) |
| [Poster - B2 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm47_poster_b2.png | [link](https://micimica.booth.pm/items/2507569) |
| Paper - A3 size<br>(with home printer) | images-dist/mm47_a3.png | |
| Paper - A4 size<br>(with home printer) | images-dist/mm47_a4.png | |

## License

### Source Code
MIT License

### Image File
Public Domain (CC0)
