# a simple way to dockerize ipython notebooks
this tutorial shows the proper way to dockerize ipython notebooks. 

while sharing notebooks through traditional means is often sufficient for data science workflows, this tutorial will allow us to work our way up to more complicated data science tasks, including distributed ml models through tensorflow + kubernetes.

## eli5, what is docker?
a docker image contains a set of packages. a docker image is a simple text file describing configurations, commands, etc. and is usually small (~5-30 loc).

running a docker image creates a docker container. a docker container contains all of the necessary packages, configurations, notebooks, etc. as result, you can share docker images freely, knowing that the recipient will have everything necessary to run your notebook.

## get docker
download [docker for mac](https://docs.docker.com/docker-for-mac/install/)

## dockerfile
there are a couple of good data science base images: [dataquestio](https://hub.docker.com/r/dataquestio/python2-starter/), [floyd-hub](https://github.com/floydhub), and [kaggle](https://github.com/Kaggle/docker-python)

we'll rely on dataquest's image. this contains a python 2 installation, jupyter notebook, and many popular data science libraries such as numpy, pandas, scrapy, scipy, scikit-learn, and nltk.

```
FROM dataquestio/python2-starter
```
copy local notebooks from `src` to `/home/ds/notebooks`.
```
COPY src /home/ds/notebooks
```


## build
do `docker build -t mynameisvinn/ipython .` dont forget the period!
this build will take a few minutes the first time, as docker starts pulling layers (eg dataquestio/python2 layer). now is a good time for a hacker news break.

## run
do `docker run -d -p 8888:8888 mynameisvinn/ipython`. this creates a docker container, which is isolated from your local machine. inside this container is a notebook, which can be accessed at `CONTAINER_IP:1111`. (find CONTAINER_IP with `docker-machine ip default`.)

*`-d` indicates detached mode.
*`-p` binds ports between container and your local machine.

## stop
do `docker stop $(docker ps -a -q)`