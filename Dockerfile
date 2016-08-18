FROM ubuntu:16.04
# FROM ubuntu:14.04

RUN apt-get update && apt-get install -y  nodejs npm  libxml2-utils python-lxml wget
# RUN apt-get install -y  libxml2-utils python-lxml 
RUN npm install -g typescript
RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD . /website/

# We can download this on the host, or we can download it in the container:
# Pushing the 1.8GB xml file to the Docker daemon works but takes some time.
# RUN cd /website && make update-dblp

RUN cd /website && make 
