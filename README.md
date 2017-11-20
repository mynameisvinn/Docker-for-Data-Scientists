# what is this?
a bare bones example to containerize jupyter notebooks. a docker image is a text file describing configurations, commands, packages. you can share images freely, knowing that the recipient will have everything necessary to run your jupyter notebook.

## whats in this dockerfile?
there are several high quality base images for data scientists including [dataquestio](https://hub.docker.com/r/dataquestio/python2-starter/), [floyd-hub](https://github.com/floydhub), and [kaggle](https://github.com/Kaggle/docker-python)

this example uses dataquest's image, which contains python 3, jupyter notebook, and many popular data science libraries such as numpy, pandas, scrapy, scipy, scikit-learn, and nltk.
```
FROM dataquestio/python3-starter  # base image
COPY notebooks /home/ds/notebooks  # copy host's notebooks folder to container's /home/ds/notebooks.
```

## from image to container
after cloning this repo, do `docker build -t mynameisvinn/my_jupyter .` dont forget the period, and replace `mynameisvinn/my_jupyter` with your own tag.

## from container to browser
do `docker run -d -p 8887:8888 -v /Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data:/home/ds/notebooks/shared_data mynameisvinn/my_jupyter`. this command creates a container running a jupyter notebook accessible from `localhost:8887`. the `-v` tag syncs host's `/Users/vincenttang/dropbox/temp/Docker-for-Data-Scientists/shared_data` folder with the container's `/home/ds/notebooks/shared_data` folder.

other helpful commands:
* *ssh into container* do `docker run -it mynameisvinn/my_jupyter`
* *stop all containers*. do `docker stop $(docker ps -a -q)`. 
* *remove images*. do `docker rmi $(docker images -a -q)`. this will delete all images from local disk.

## docker compose
alternatively, assuming the [image can be pulled from dockerhub](https://hub.docker.com/r/mynameisvinn/my_jupyter/), you can run `docker-compose up`.