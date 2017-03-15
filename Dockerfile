FROM mhart/alpine-node:latest
MAINTAINER Taimos GmbH <info@taimos.de>

RUN apk --upgrade --verbose --update-cache add bash groff less python py-pip git && \
	pip install awscli && \
	rm /var/cache/apk/* && \
	npm install -g yarn