FROM yandex/ubuntu

# install pypy3
RUN curl http://buildbot.pypy.org/nightly/py3k/pypy-c-jit-latest-linux64.tar.bz2 | tar -jxf - && mv pypy* /opt/pypy3
ENV PATH $PATH:/opt/pypy3/bin
# install setuptools for pypy3
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | pypy
RUN rm *.zip

ENV HOME /root

WORKDIR /root
