FROM yandex/ubuntu:12.04

# install pypy3
RUN curl http://buildbot.pypy.org/nightly/py3k/pypy-c-jit-latest-linux64.tar.bz2 | tar -jxf - && mv pypy* /opt/pypy3
#ENV PYTHONPATH /opt/pypy3/site-packages
ENV PATH $PATH:/opt/pypy3/bin
ENV LANG C.UTF-8
# install setuptools for pypy3
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | pypy
RUN rm *.zip
# install pip==1.4.1, because 1.5.4 segfaults for unknown reason
RUN easy_install pip==1.4.1

ENV HOME /root

WORKDIR /root
