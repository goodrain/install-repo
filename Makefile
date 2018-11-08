all: centos
centos:
	@docker build -t rainbond/pkg-download:centos-1708-v5 download/centos-7