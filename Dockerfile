FROM dataquestio/python2-starter

RUN pip install flask
RUN pip install -U numpy scipy scikit-learn

COPY notebooks /home/ds/notebooks

WORKDIR /home/ds/notebooks
ENV FLASK_APP=app.py
ENV FLASK_DEBUG=0
CMD ["python", "app.py"]