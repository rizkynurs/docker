FROM jenkins/jenkins:lts

USER root
RUN apt-get update -y && \
apt-get install -y \
wget \ 
git \
vim \ 
nano \
ntpdate \ 
netcat-openbsd \
telnet \
net-tools \
dnsutils \
maven \
rsync \
docker.io docker-compose && \
rm -rf /etc/localtime && \
ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

RUN usermod -aG docker jenkins
USER jenkins