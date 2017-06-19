# a simple way to dockerize ipython notebooks
this tutorial shows the proper way to dockerize ipython notebooks. 

while sharing notebooks through traditional means is often sufficient for data science workflows, this tutorial will allow us to work our way up to more complicated data science tasks, including distributed ml models through tensorflow + kubernetes.

## get docker
download [docker for mac](https://docs.docker.com/docker-for-mac/install/)

## dockerfile
there are a couple of good data science base images: [dataquestio](https://hub.docker.com/r/dataquestio/python2-starter/) and [floyd-hub](https://github.com/floydhub).
```
FROM dataquestio/python2-starter
```
copy local notebooks from `src` to `/home/ds/notebooks`.
```
COPY src /home/ds/notebooks
```

## build
do `docker build -t mynameisvinn/ipython .`
dont forget the period!

## run
do `docker run -d -p 8888:1111 mynameisvinn/ipython`. 

to access the dockerized notebook, go to `CONTAINER_IP:1111`. note: you can find CONTAINER_IP with `docker-machine ip default`. 

## stop docker containers
do `docker stop $(docker ps -a -q)`