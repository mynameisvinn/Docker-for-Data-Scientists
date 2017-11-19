# what is this?
this repo contains a bare bones example to containerize jupyter notebooks.

## from image to container
after cloning this repo, do `docker build -t mynameisvinn/ipython .` dont forget the period, and replace `mynameisvinn/ipython` with your own tag.

this process will take a few minutes the first time, as docker starts pulling layers (eg dataquestio/python2 layer).

## running
do `docker run -d -p 8888:8888 mynameisvinn/ipython`. this command creates a container running a jupyter notebook, which can be accessed at `CONTAINER_IP:8888`. (find CONTAINER_IP with `docker-machine ip default`.)

some other helpful commands:
* *ssh into container* do `docker run -it mynameisvinn/ipython`
* *stop containers*. do `docker stop $(docker ps -a -q)`
* *remove images*. do `docker rmi $(docker images -a -q)`

## faqs
#### docker eli5
a docker image is a small text file (~5-30 loc) describing configurations, commands, packages. you can share docker images freely, knowing that the recipient will have everything necessary to run your notebook.

#### where to get it?
download [docker for mac](https://docs.docker.com/docker-for-mac/install/)

#### dockerfile
there are several high quality base images for data scientists including [dataquestio](https://hub.docker.com/r/dataquestio/python2-starter/), [floyd-hub](https://github.com/floydhub), and [kaggle](https://github.com/Kaggle/docker-python)

this example uses dataquest's image, which contains python 2, jupyter notebook, and many popular data science libraries such as numpy, pandas, scrapy, scipy, scikit-learn, and nltk.
```
FROM dataquestio/python2-starter  # use prebuilt docker image
COPY notebooks /home/ds/notebooks  # copy local notebooks from `src` to `/home/ds/notebooks`.
```


