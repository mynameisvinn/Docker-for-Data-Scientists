# what is this?
a bare bones example to containerize jupyter notebooks. 

## instructions
#### spinning up a docker container
after cloning this repo, do `docker build -t mynameisvinn/ds .` (dont forget the period, and replace `mynameisvinn/ds` with your own tag.)

#### running the container
after pulling in the appropriate images (eg python:3.6-slim), we run the container with `docker run -d -p 8887:8888 -v /Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data:/home mynameisvinn/ds`. this creates a container - which runs a jupyter notebook accessible from `localhost:8887` (password: demo) - accessible through a browser.

the `-v` tag syncs the localhost's `/Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data` folder with the container's `/home` folder.

other helpful commands:
* *ssh into container* do `docker run -it mynameisvinn/ds`
* *stop all containers*. do `docker stop $(docker ps -a -q)`. 
* *remove images*. do `docker rmi $(docker images -a -q)`. this will delete all images from local disk.

## docker compose
alternatively, assuming the [image can be pulled from dockerhub](https://hub.docker.com/r/mynameisvinn/ds/), you can run `docker-compose up`.