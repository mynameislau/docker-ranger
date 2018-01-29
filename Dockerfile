FROM python:3.6.4-alpine3.7
RUN apk update
RUN apk add git
RUN apk add make
RUN mkdir -p /home/app/work
RUN cd /home/app/
RUN git clone https://github.com/ranger/ranger.git
RUN ls -la ranger
RUN cd ranger && make install
RUN mkdir -p /home/app/filesystem
WORKDIR /home/app/filesystem
ENTRYPOINT [ "ranger" ]