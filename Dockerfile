FROM dataquestio/python3-starter

# copy src notebooks folder to image
COPY notebooks /home/ds/notebooks

# create temp folder
WORKDIR /home/ds/notebooks
RUN mkdir shared_data

# set up volume allows data to persist
VOLUME ["shared_data"]