FROM golang:alpine as builder

WORKDIR /go/src/

RUN apk add git
RUN go env -w GOPROXY=https://goproxy.io,direct \
    && git clone https://github.com/wolf-joe/ts-dns.git
RUN cd ts-dns/cmd \
    && go build -o ts-dns

FROM alpine as prod

RUN apk --no-cache add ca-certificates bind-tools

WORKDIR /root/

COPY --from=0 /go/src/ts-dns/cmd/ts-dns .

cmd cd /root && ./ts-dns

