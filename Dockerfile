FROM golang:1.10-alpine
MAINTAINER Ael Gain <ael@habx.fr>

EXPOSE 5000

RUN apk add git

RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz && \
    tar xvzf GeoLite2-City.tar.gz && \
    find . -name "*.mmdb" -exec mv {} ./geodb.mmdb \;

RUN go get github.com/klauspost/geoip-service

CMD ["geoip-service", "-db=./geodb.mmdb"]
