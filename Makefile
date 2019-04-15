all: centos debian ubuntu 
centos:
	@docker build -t rainbond/pkg-download:centos-7.4-v5.x download/centos-7.4
	@docker build -t rainbond/pkg-download:centos-7.6-v5.x download/centos-7.6

debian:
	@docker build -t rainbond/pkg-download:debian-95-v5.x download/debian-9

ubuntu:
	@docker build -t rainbond/pkg-download:ubuntu-1604-v5.x download/ubuntu-16

build_offline: centos
	@docker run --rm -v ${PWD}/rpm/centos/7.4:/opt/rainbond/install/install/pkgs/centos rainbond/pkg-download:centos-7.4-v5.x
	@docker run --rm -v ${PWD}/rpm/centos/7.6:/opt/rainbond/install/install/pkgs/centos rainbond/pkg-download:centos-7.6-v5.x