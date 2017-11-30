# what is this?
a bare bones example to containerize jupyter notebooks. you can share images freely, knowing that the recipient will have everything necessary to run your jupyter notebook.

## instructions
#### from image to container
clone this repo, then do `docker build -t mynameisvinn/ds .` dont forget the period, and replace `mynameisvinn/ds` with your own tag.

#### from container to browser
do `docker run -d -p 8887:8888 -v /Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data:/home mynameisvinn/ds`. this will create a container running a jupyter notebook accessible from `localhost:8887`, which can be accessed with the password `demo`.

the `-v` tag syncs host's `/Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data` folder with the container's `/home` folder.

other helpful commands:
* *ssh into container* do `docker run -it mynameisvinn/ds`
* *stop all containers*. do `docker stop $(docker ps -a -q)`. 
* *remove images*. do `docker rmi $(docker images -a -q)`. this will delete all images from local disk.

## docker compose
alternatively, assuming the [image can be pulled from dockerhub](https://hub.docker.com/r/mynameisvinn/ds/), you can run `docker-compose up`.