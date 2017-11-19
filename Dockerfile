FROM dataquestio/python3-starter

# copy src notebooks folder to image
COPY notebooks /home/ds/notebooks

# set working dir
WORKDIR /home/ds/notebooks