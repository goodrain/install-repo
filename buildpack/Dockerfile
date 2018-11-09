FROM debian:9.5

RUN apt update && apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https ca-certificates curl wget && \
    rm -rf /var/lib/apt/lists/* 

ADD download.sh /download.sh

COPY language /language

RUN chmod +x /download.sh

ENTRYPOINT [ "/download.sh" ]