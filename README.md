# what is this?
template for dockerizing ipython notebooks.

## dockerfile
we'll use [dataquestio](https://hub.docker.com/r/dataquestio/python2-starter/). [floyd-hub](https://github.com/floydhub) is an good alternative base for deep learning.
```
FROM dataquestio/python2-starter
```
copy local notebooks from `src` to `/home/ds/notebooks`.
```
COPY src /home/ds/notebooks
```

## build
do `docker build -t mynameisvinn/foo .  # dont forget the period`

## run
do `docker run -d -p 8888:8888 mynameisvinn/foo`

find CONTAINER_IP with `docker-machine ip default`. then go to CONTAINER_IP:8888. 