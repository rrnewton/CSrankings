FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y libxml2-utils npm python-lxml basex; npm install -g typescript google-closure-compiler

# RUN apt-get install -y python3-pip
RUN apt-get install -y python-pip
RUN apt-get install -y pypy
RUN pip install xmltodict future

ADD . /src
WORKDIR /src

RUN make

RUN apt-get install -y python3

EXPOSE 8000
CMD ["python3", "-m", "http.server"]

# Run with, e.g.:
#   docker run -it --rm -p 0.0.0.0::8000 csrankings bash
#   docker run -it --rm -p 127.0.0.1:8000:8000 csrankings bash
