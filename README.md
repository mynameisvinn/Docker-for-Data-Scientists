# a simple way to dockerize ipython notebooks
this tutorial shows the proper way to dockerize ipython notebooks. 

while sharing notebooks through traditional means is often sufficient for data science workflows, this tutorial will allow us to work our way up to more complicated data science tasks, including distributed ml models through tensorflow + kubernetes.

## eli5, what is docker?
docker containers are tiny, self-contained boxes that you can grab and run without fiddling with configuration, and without worry that they'll touch anything else outside of their little box.

Imagine you wanted to run a db and a website. if you didn't want anything on one of them to be able to affect the other one, you might put them on two separate computers. This would isolate them from one another, but it's expensive, because now you're paying for two computers that probably aren't being utilized 100%.

Virtualization, like VMs and such, allowed you to run these servers isolated from each other but on the same machine. This was more efficient, cheaper, etc than separate servers. but it was also sometimes inefficient, since the VM had to contain the ENTIRE operating system--this is why you can run linux inside of Windows, or Windows inside of MacOs. But if what your server was running a flavor of linux and both your web server and db server VMs were running the same flavor of linux? Too bad, you had to duplicate the entire thing inside of both VMs. Thus the relative inefficiency.

Docker allows you to run stuff, like our web server and db server, or anything at all, like the ipython notebooks, inside a tiny little box (called a container). This keeps everything isolated in that things can't touch anything outside their box and all ports for communication to the outside world have to be explicitly allowed. In addition, Docker and containers in general allow you to take advantage of situations like above, where everything was running on the same OS--you don't need to duplicate EVERYTHING to still achieve isolation. This allows you to run many, many of them on a single machine and thus gain more density/efficiency.

Docker "images", as they're called, describe the setup of the container: what's installed and running inside, how it's configured, what commands it should run when it is first started. This also allows for someone to grab an image and (usually, hopefully, etc) "just run it." All the config and setup has already been declared for you and it should hopefully "just work."
And then you can do things like have clusters of machines that can run containers (aka, act like "places where you can put a box") so you can get extra resiliency, scaling, etc.

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