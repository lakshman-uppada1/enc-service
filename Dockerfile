FROM node:8.0.0
MAINTAINER "S M Y ALTAMASH" "smy.altamash@gmail.com"
WORKDIR /home/enc
COPY . /home/enc
RUN sed -i '/jessie/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt update
RUN apt install -y python make g++
RUN npm i
RUN apt remove --purge -y python make g++
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
EXPOSE 8013
CMD sh entrypoint.sh
