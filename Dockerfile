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