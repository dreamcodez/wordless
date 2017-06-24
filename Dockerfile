# BUILD LAYER
FROM golang:1.8.3-alpine AS build-env
WORKDIR /go/src/app

# install git
RUN \
  apk update &&\
  apk add git &&\
  rm -rf /var/cache/apk/*

# set build workdir
ENV GOPATH /go

# install dep
RUN go get -u github.com/golang/dep/cmd/dep

# dep updates
COPY *.go ./
COPY Gopkg.* ./
RUN /go/bin/dep ensure -update

# build app
RUN go build

# RUNTIME LAYER
FROM alpine
WORKDIR /app

COPY --from=build-env /go/src/app/app ./
ENTRYPOINT ./app
