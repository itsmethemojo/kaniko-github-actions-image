ARG KANIKO_VERSION=1.9.1

FROM gcr.io/kaniko-project/executor:v${KANIKO_VERSION} as kaniko

FROM node:19-slim

COPY --from=kaniko /kaniko/executor /kaniko/executor
