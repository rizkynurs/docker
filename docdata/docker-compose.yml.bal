version: '3.8'
services:
  centos:
    image: centos:7
    container_name: centos7
    restart: always
    tty: true
    privileged: true
    network_mode: bridge
    ports:
      - '80:80'
      - '443:443'
      - '22:22'
    volumes:
      - /etc/hosts:/etc/hosts
      - /Users/rizky/data:/data
    command: >
      /bin/bash -c " 
        sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* &&
        sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* &&
        yum update -y &&
        yum -y install epel-release &&
        yum groupinstall 'Development Tools' -y &&
        yum install -y wget git vim nano ntpdate nc telnet net-tools bind-utils openssl-devel curl bzip2-devel libffi-devel zlib-devel python3 pip3 &&
        rm -rf /etc/localtime && 
        ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime &&
        tail -f /dev/null"
