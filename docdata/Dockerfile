FROM centos:7
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum update -y && \
    yum -y install epel-release && \
    yum groupinstall 'Development Tools' -y && \
    yum install -y \
    wget \ 
    git \
    vim \ 
    nano \
    ntpdate \ 
    nc \
    telnet \
    net-tools \
    bind-utils \
    openssl-devel \ 
    openssh-server \
    curl \
    bzip2-devel \
    libffi-devel \
    zlib-devel \
    python3 \
    openssh-server \
    openssh-clients \
    python3-pip \
    rsync \
    nodejs \
    samba && \
    rm -rf /var/run/rsyncd.pid && \
    rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
#    systemctl start sshd && \
#    systemctl enable sshd && \
    yum clean all

RUN cat <<EOF > /etc/rsyncd.conf
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsync.lock
log file = /var/log/rsync.log
port = 12000

[data]
path = /data/
comment = RSYNC FILES
read only = false
timeout = 300
hosts allow = 172.21.0.2
hosts deny = *
uid = root
gid = root
EOF

WORKDIR /data
#RUN git clone https://github.com/dzt/trimalchio.git

EXPOSE 80 443 22

#CMD ["/bin/bash"]
