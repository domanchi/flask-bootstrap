FROM tiangolo/uwsgi-nginx:python2.7
MAINTAINER Aaron Loo "domanchi@umich.edu"

RUN pip install --upgrade pip 
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

#ADD ./app /src
VOLUME /src
WORKDIR /src

ADD nginx.conf /etc/nginx/conf.d/

CMD ["python", "/src/app.py"]
