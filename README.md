[![Build Status](https://travis-ci.org/goodrain/install-repo.svg?branch=master)](https://travis-ci.org/goodrain/install-repo)
# install-repo

云帮安装过程需要的依赖包

- docker
- k8s
- nfs/gfs/ceph
- 常用系统工具包

镜像 `rainbond/install-repo:master`

```
docker run -it -p 2017:2017 -v /var/log/caddy:/var/log/caddy  rainbond/install-repo:master
```