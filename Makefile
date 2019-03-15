all: centos debian ubuntu 
centos:
	@docker build -t rainbond/pkg-download:centos-7.4-v5.1 download/centos-7

debian:
	@docker build -t rainbond/pkg-download:debian-95-v5.1 download/debian-9

ubuntu:
	@docker build -t rainbond/pkg-download:ubuntu-1604-v5.1 download/ubuntu-16

build_offline: centos
	@docker run --rm -v ${PWD}/rpm/centos/7:/opt/rainbond/install/install/pkgs/centos rainbond/pkg-download:centos-7.4-v5.1