FROM nikicat/ubuntu:12.04

# install python3 and pypy3
RUN apt-add-repository 'deb http://nikicat.github.io/pypy3-repo ./'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install python3 pypy3 -y --force-yes

# install setuptools for pypy3
ENV PYTHONPATH /usr/lib/pypy3/site-packages
RUN mkdir $PYTHONPATH
RUN curl ez_setup.py | pypy3

ENV HOME /root

WORKDIR /root
