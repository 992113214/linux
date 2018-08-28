#!/bin/bash
expect <<EOF
spawn ssh -X  $1
expect "#" {send "rm -rf /etc/yum.repo.d/*\r"}
expect "#" {send "yum-config-manager --add ftp://192.168.4.254/cen/\r"}
expect "#" {send "sed -i '5i gpgcheck=0' /etc/yum.repos.d/192.168.4.254_cen_.repo\r"}
expect "#" {send "yum repolist\r"}
expect "#" {send "exit\r"}
EOF
echo
