#!/bin/bash

PKG_PATH=/opt/rainbond/install/install/pkgs

base_pkg=(yum-utils tar jq wget curl nano perl tree lsof htop nload net-tools telnet rsync git ntp ntpdate pwgen iproute bash-completion createrepo sshpass python2-pip pwgen expect ansible createrepo zip unzip )
system_pkg=(device-mapper-persistent-data conntrack-tools iotop lvm2 dstat psmisc socat chrony ipset ipvsadm bind-utils keepalived )
network_pkg=(bridge-utils )
storage_pkg=(glusterfs-server nfs-utils samba samba-client samba-common )
docker=(docker-ce )

if [ "$1" == "bash" ];then
    exec /bin/bash
else
    # yum install -y centos-release-gluster
    # yum install -y epel-release
    for pkg in ${base_pkg[@]} ${system_pkg[@]} ${network_pkg[@]} ${storage_pkg[@]} ${docker[@]}
    do
        if [[ "$pkg" =~ "docker-ce" ]]; then
            yum install docker-ce-$(yum list --showduplicates 'docker-ce' | grep '18.06.*el' | tail -1 | awk '{print $2}') --downloadonly --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
            [ "$?" != 0 ] && echo "download $pkg failed"
        else
            yum install ${pkg} --downloadonly --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
            [ "$?" != 0 ] && echo "download $pkg failed"
        fi
        ls $PKG_PATH/centos/ | grep "$pkg" >/dev/null 2>&1
        if [ "$?" == 0 ]; then
            echo "download centos $pkg ok"
        else
            echo "download centos $pkg failed"
        fi
    done
    yum install -y createrepo >/dev/null 2>&1
    createrepo /opt/rainbond/install/install/pkgs/centos/  >/dev/null 2>&1
fi
