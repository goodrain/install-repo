FROM debian:9.5

RUN apt update && apt-get install --no-install-recommends --no-install-suggests -y gnupg apt-transport-https ca-certificates procps curl wget dirmngr && \
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub |  apt-key add - && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-get remove --purge --auto-remove wget curl -y --allow-remove-essential && \
    rm -rf /var/lib/apt/lists/* 

ADD rbd.list /etc/apt/sources.list.d/rbd.list

ADD download.sh /download.sh

RUN chmod +x /download.sh

ENTRYPOINT [ "/download.sh" ]