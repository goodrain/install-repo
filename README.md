[![Build Status](https://travis-ci.org/goodrain/install-repo.svg?branch=master)](https://travis-ci.org/goodrain/install-repo)
# install-repo

Rainbond在CentOS 7.4/7.6上安装需要的依赖包

- docker(18.06)
- 常用系统工具包

镜像 `rainbond/pkg-repo:centos-7.4-v5.x`

```
docker run -it -p 2017:2017 -v /var/log/caddy:/var/log/caddy rainbond/pkg-repo:centos-7.4-v5.x
```