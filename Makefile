all: centos debian ubuntu
centos:
	@docker build -t rainbond/pkg-download:centos-1708-v5 download/centos-7

debian:
	@docker build -t rainbond/pkg-download:debian-95-v5 download/debian-9

ubuntu:
	@docker build -t rainbond/pkg-download:ubuntu-1604-v5 download/ubuntu-16