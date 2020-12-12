FROM alpine

RUN apk add --no-cache \
		ansible \
		python3 \
		curl

RUN python3 -m ensurepip

RUN ln -sf python3 /usr/bin/python


RUN pip3 install --no-cache --upgrade \
		pip \
		setuptools \
		docker \
		docker-compose



#RUN chmod +x /usr/local/bin/docker-compose

WORKDIR /data
