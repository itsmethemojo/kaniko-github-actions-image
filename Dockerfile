ARG KANIKO_VERSION=1.9.1

FROM alpine as certs

RUN apk --update add ca-certificates

FROM gcr.io/kaniko-project/executor:v${KANIKO_VERSION} as kaniko

FROM node:19-slim

COPY --from=kaniko /kaniko/executor /kaniko/executor

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENV DOCKER_CONFIG=/kaniko/.docker/

ENV HOME=/workspace

RUN mkdir /workspace
