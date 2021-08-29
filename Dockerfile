#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:20.04

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y build-essential curl jq unzip bash && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG VERSION

RUN curl --silent "https://api.github.com/repos/binance-chain/bsc/releases/tags/v1.1.2" | jq -c '.assets[] | select( .browser_download_url | contai>    unzip mainnet.zip -d / && \
    sed -i 's/^HTTPHost.*/HTTPHost = "0.0.0.0"/' /config.toml && \
    sed -i '/^WSPort.*/a WSHost = "0.0.0.0"' /config.toml && \
    sed -i 's/^HTTPVirtualHosts.*/HTTPVirtualHosts = ["*"]/' /config.toml && \
    sed -i '/Node\.LogConfig/,/^$/d' /config.toml && \
    mv geth_linux /usr/bin/bsc && \
    chmod +x /usr/bin/bsc

ENV BSC_DATADIR=/root/.ethereum

COPY docker-entrypoint.sh /entrypoint.sh

#VOLUME ["$BSC_DATADIR"]
