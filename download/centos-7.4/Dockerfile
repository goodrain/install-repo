FROM centos:7.4.1708

ADD rbd.repo /etc/yum.repos.d/rbd.repo

ADD download.sh /download.sh

RUN chmod +x download.sh && rm -rf  /etc/yum.repos.d/CentOS*.repo

ENTRYPOINT [ "/download.sh" ]