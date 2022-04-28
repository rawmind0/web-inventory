FROM rawmind/alpine-base:3.15-2
MAINTAINER Raul Sanchez <rawmind@gmail.com>

ENV SERVICE_HOME=/opt/web-inventory     SERVICE_NAME=web-inventory     SERVICE_TAG=0.2-0     GOMAXPROCS=2     GOROOT=/usr/lib/go     GOPATH=/opt/src     GOBIN=/gopath/bin
ENV PATH=$PATH:$SERVICE_HOME

# Add service files
ADD root/src /opt/src/github.com/rawmind0/web-inventory
ADD root/test.sh /tmp/

RUN apk add --update go git musl-dev jq \ 
  && mkdir -p /opt/src/github.com/rawmind0/web-inventory ${SERVICE_HOME}; cd /opt/src/github.com/rawmind0/web-inventory   && CGO_ENABLED=0 go build -ldflags "-X main.VERSION=${SERVICE_TAG} -extldflags -static -s" -o ${SERVICE_NAME}   && mv ./${SERVICE_NAME} ${SERVICE_HOME}; cd ${SERVICE_HOME}   && chmod +x ${SERVICE_HOME}/${SERVICE_NAME}   && apk del go git musl-dev   && rm -rf /var/cache/apk/* /opt/src 

EXPOSE 8080

WORKDIR ${SERVICE_HOME}

ENTRYPOINT ["/opt/web-inventory/web-inventory"]
