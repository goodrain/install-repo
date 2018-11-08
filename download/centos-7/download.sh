#!/bin/bash

if [ "$1" == "bash" ];then
    exec /bin/bash
else
    PKG_PATH=/opt/rainbond/install/install/pkgs
    common_pkg=(tar ntpdate wget perl bind-utils curl tree lsof htop nload net-tools telnet rsync git dstat salt-master salt-minion salt-ssh iotop lvm2 ntpdate pwgen iproute bash-completion createrepo)
    storage_pkg=(glusterfs-server nfs-utils)
    network_pkg=(bridge-utils)
    k8s_pkg=(kubelet kubeadm kubectl)
    docker_ce_pkg=(docker-ce)
    k8s_version=(1.10.9-0)
    docker_version=(17.03.2.ce)
    yum install centos-release-gluster -y -q
    yum install -y epel-release -y -q
    for pkg in ${common_pkg[@]} ${storage_pkg[@]} ${network_pkg[@]}
    do
        yum install ${pkg} --downloadonly --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
        ls $PKG_PATH/centos/ | grep "$pkg" >/dev/null 2>&1
        if [ "$?" == 0 ];then
            echo "download centos $pkg ok"
        else
            echo "download centos $pkg failed"
        fi
    done
    for version in ${k8s_version[@]}
    do
        for pkg in ${k8s_pkg[@]}
        do
            yum install ${pkg} --downloadonly --disableexcludes=kubernetes --downloaddir=$PKG_PATH/centos/ >/dev/null 2>&1
            ls $PKG_PATH/centos/ | grep "$pkg" >/dev/null 2>&1
            if [ "$?" == 0 ];then
                echo "download centos $pkg ok"
            else
                echo "download centos $pkg failed"
            fi
        done
    done
    yum install -y createrepo >/dev/null 2>&1
    createrepo /opt/rainbond/install/install/pkgs/centos/  >/dev/null 2>&1
fi