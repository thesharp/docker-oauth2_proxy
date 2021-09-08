FROM alpine:latest as builder

ENV VERSION oauth2-proxy-v7.1.3.linux-amd64

RUN wget "https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v7.1.3/${VERSION}.tar.gz" && tar xvf ${VERSION}.tar.gz && mv ${VERSION}/oauth2-proxy /oauth2-proxy

FROM alpine:latest

RUN apk --no-cache add ca-certificates
COPY --from=builder /oauth2-proxy /oauth2-proxy

ENTRYPOINT ["/oauth2-proxy"]
