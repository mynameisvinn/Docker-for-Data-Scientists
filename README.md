# what's this?
this is the simplest example of sharing notebooks with docker. 

## lets get started
### building da container
clone this repo and do `docker build -t mynameisvinn/ds .` (note: (1) dont forget the period and (2) you could call the docker container whatever you want.) 

docker executes a sequence of commands specified by the [dockerfile](https://github.com/mynameisvinn/Docker-for-Data-Scientists/blob/master/Dockerfile) including (a) fetching a base python 3.6 layer; (b) copying `requirements.txt` and the `notebooks` folder into the container; (c) executing shell commands such as `pip install`, setting the working directory to `home`, exposing port 8888, and finally launching a notebook.
```bash
FROM python:3.6-slim

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY notebooks /home
WORKDIR /home

# Exposing ports
EXPOSE 8888

# Running jupyter notebook
# --NotebookApp.token ='demo' is the password
CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token='demo'"]
```

### running da container
now that we've built the container, we can run it.

we run with `docker run -d -p 8887:8888 mynameisvinn/ds`. this container launches a notebook at `localhost:8887` (password: demo).

#### syncing files between local and container
we could also do `docker run -d -p 8887:8888 -v /Users/vincent1/dropbox/temp/Docker-for-Data-Scientists/shared_data:/home mynameisvinn/ds`, which maps local's `shared_data` folder with the container's `home` folder. 

other helpful commands:
* *ssh into container* do `docker run -it mynameisvinn/ds`
* *stop all containers*. do `docker stop $(docker ps -a -q)`. 
* *remove images*. do `docker rmi $(docker images -a -q)`. this will delete all images from local disk.

## docker compose
alternatively, assuming the [image can be pulled from dockerhub](https://hub.docker.com/r/mynameisvinn/ds/), you can run `docker-compose up`.