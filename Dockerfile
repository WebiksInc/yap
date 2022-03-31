FROM golang:1.12-buster

RUN apt update && apt install bzip2

RUN mkdir -p /yap/src
COPY . /yap/src/yap

ENV GOPATH=/yap
WORKDIR /yap/src/yap
RUN apt update && apt install ca-certificates libgnutls30 -y

# RUN bunzip2 data/*.bz2
RUN go get .
RUN go build .

EXPOSE 8000

ENTRYPOINT ["/yap/src/yap/yap", "api"]

