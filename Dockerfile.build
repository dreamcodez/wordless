FROM golang:1.8.3-alpine

# install git
RUN \
  apk update &&\
  apk add git &&\
  rm -rf /var/cache/apk/*

# set build workdir
WORKDIR /go/src/app
ENV GOPATH /go

# install dep
RUN go get -u github.com/golang/dep/cmd/dep

# dep updates
COPY *.go ./
COPY Gopkg.* ./
RUN /go/bin/dep ensure -update

# build app
RUN go build
