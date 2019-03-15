#!/bin/bash

PKG_PATH=/opt/rainbond/install/install/pkgs

base_pkg=(tar jq wget curl perl tree lsof htop nload net-tools telnet rsync git ntpdate pwgen iproute bash-completion createrepo sshpass python-pip uuidgen pwgen expect ansible)
system_pkg=(conntrack-tools iotop lvm2 dstat psmisc socat  ipset ipvsadm bind-utils )
network_pkg=(bridge-utils )
storage_pkg=(glusterfs-server nfs-utils)

if [ "$1" == "bash" ];then
    exec /bin/bash
else
    yum install -y centos-release-gluster
    yum install -y epel-release
    for pkg in ${base_pkg[@]} ${system_pkg[@]} ${network_pkg[@]} ${storage_pkg[@]}
    do
        yum install ${pkg} --downloadonly --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
        ls $PKG_PATH/centos/ | grep "$pkg" >/dev/null 2>&1
        if [ "$?" == 0 ];then
            echo "download centos $pkg ok"
        else
            echo "download centos $pkg failed"
        fi
    done
    #pkg_suffix="el"
    #pkg_manager="yum"
    #pkg_pattern="$(echo "18.06" | sed "s/-ce-/\\\\.ce.*/g" | sed "s/-/.*/g").*$pkg_suffix"
	#search_command="$pkg_manager list --showduplicates 'docker-ce' | grep '$pkg_pattern' | tail -1 | awk '{print \$2}'"
	yum install docker-ce-$(yum list --showduplicates 'docker-ce' | grep '18.06.*el' | tail -1 | awk '{print $2}') --downloadonly --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
    yum install -y createrepo >/dev/null 2>&1
    createrepo /opt/rainbond/install/install/pkgs/centos/  >/dev/null 2>&1
fi