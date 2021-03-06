FROM python:2.7
MAINTAINER Philipp Havrilla "philipp.havrilla@bluewin.ch"
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    netcat \
    gettext
ENV PYTHONUNBUFFERED 1
RUN mkdir /home/django/
WORKDIR /home/django/
ADD requirements.txt /home/django/
RUN pip install -r requirements.txt
RUN adduser --disabled-password --gecos '' whoami