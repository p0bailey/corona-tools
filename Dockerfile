FROM debian:buster-slim

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    unzip \
    yamllint \
    unzip \
    software-properties-common 

RUN curl -sL https://deb.nodesource.com/setup_12.x |  bash -

RUN apt-get update && apt-get install -y nodejs

RUN npm install -g corona-cli


