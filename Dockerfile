FROM nikicat/ubuntu

# install python3 and pypy3
RUN apt-add-repository 'deb http://nikicat.github.io/pypy3-repo ./'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install pypy3 -y --force-yes

# install setuptools for pypy3
ENV PYTHONPATH /usr/lib/pypy3/site-packages
RUN mkdir $PYTHONPATH
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | pypy3
RUN rm *.zip

ENV HOME /root
ENV PATH $PATH:/usr/lib/pypy3/bin

WORKDIR /root
