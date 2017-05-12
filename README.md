# Docker Example
template for dockerizing ipython notebooks

## compose a dockerfile
a dockerfile consists of the following:
* base image. we'll use dataquestio's docker image. [floyd-hub](https://github.com/floydhub) is another good docker base for deep learning.
* some instructions. in this example, our docker image copies `src` to `/home/ds/notebooks`.

## build
do `docker build -t mynameisvinn/foo .`

## run
do `docker run -d -p 8888:8888 mynameisvinn/foo`

find CONTAINER_IP with `docker-machine ip default`. then go to CONTAINER_IP:8888. 