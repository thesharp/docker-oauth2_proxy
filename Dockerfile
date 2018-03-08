FROM alpine:latest as builder

ENV VERSION oauth2_proxy-2.2.0.linux-amd64.go1.8.1

RUN wget "https://github.com/bitly/oauth2_proxy/releases/download/v2.2/${VERSION}.tar.gz" && tar xvf ${VERSION}.tar.gz && mv ${VERSION}/oauth2_proxy /oauth2_proxy

FROM alpine:latest

RUN apk --no-cache add ca-certificates
COPY --from=builder /oauth2_proxy /oauth2_proxy

ENTRYPOINT ["/oauth2_proxy"]
