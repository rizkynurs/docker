FROM centos:7

ENV openssl=1.1.1o
ENV nginx=1.22.1

#if using lot of function RUN can make the big image
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    yum update -y && yum -y install epel-release && \
    yum groupinstall "Development Tools" -y && \
    yum install -y shadow-utils ntpdate vim nano nc telnet wget mariadb-devel python3 python3-devel unzip  bzip2-devel postgresql-devel bind-utils libffi-devel git gcc net-tools curl pcre mtr pcre-devel libxml2 htop libxml2-devel iproute curl-devel openssh-clients ntpdate geoip-devel cronie cmake geoip zlib-devel make openssl openssl-devel davfs2 lua-devel gd-devel && \
    groupadd -g 500 www-data && useradd -r -g www-data -u 500 -s /sbin/nologin www-data && \
    mkdir -p /usr/local/module-nginx && \
    cd /usr/local/module-nginx && \
    wget https://github.com/openresty/headers-more-nginx-module/archive/refs/heads/master.zip && unzip master.zip && mv headers-more-nginx-module-master headers-more-nginx-module && rm -rf master.zip  && \
    wget https://github.com/AirisX/nginx_cookie_flag_module/archive/refs/heads/master.zip &&  unzip master.zip &&  mv nginx_cookie_flag_module-master nginx_cookie_flag_module && rm -rf master.zip && \
    wget https://github.com/wandenberg/nginx-push-stream-module/archive/refs/heads/master.zip && unzip master.zip && mv nginx-push-stream-module-master nginx-push-stream-module && rm -rf master.zip && \
    wget https://github.com/FRiCKLE/ngx_cache_purge/archive/refs/heads/master.zip && unzip master.zip && mv ngx_cache_purge-master ngx_cache_purge && rm -rf master.zip && \
    wget https://github.com/replay/ngx_http_lower_upper_case/archive/refs/heads/master.zip && unzip master.zip && mv ngx_http_lower_upper_case-master ngx_http_lower_upper_case && rm -rf master.zip && \
    wget https://github.com/leev/ngx_http_geoip2_module/archive/refs/heads/master.zip &&  unzip master.zip && mv ngx_http_geoip2_module-master ngx_http_geoip2_module && rm -rf master.zip && \
    wget https://github.com/masterzen/nginx-upload-progress-module/archive/refs/heads/master.zip && unzip master.zip && mv nginx-upload-progress-module-master nginx-upload-progress-module && rm -rf master.zip && \
    wget https://github.com/vozlt/nginx-module-vts/archive/refs/heads/master.zip && unzip master.zip && mv nginx-module-vts-master nginx-module-vts && rm -rf master.zip && \
    wget https://openssl.org/source/old/1.1.1/openssl-${openssl}.tar.gz && tar -xf openssl-${openssl}.tar.gz && rm -rf openssl-${openssl}.tar.gz
RUN mkdir -p /sources
WORKDIR /sources
RUN wget https://nginx.org/download/nginx-${nginx}.tar.gz && \
    tar -xf nginx-${nginx}.tar.gz && \
    cd /sources/nginx-${nginx} && \
    ./configure --prefix=/opt/nginx --with-http_v2_module --with-http_ssl_module --with-ipv6 --with-http_stub_status_module --with-http_dav_module --with-file-aio --with-threads --with-http_realip_module --with-http_geoip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-pcre --with-http_image_filter_module --with-http_sub_module --with-http_flv_module --with-http_mp4_module --with-openssl=/usr/local/module-nginx/openssl-1.1.1o --add-module=/usr/local/module-nginx/ngx_cache_purge --add-module=/usr/local/module-nginx/ngx_http_lower_upper_case  --add-module=/usr/local/module-nginx/nginx-push-stream-module --add-module=/usr/local/module-nginx/nginx_cookie_flag_module --add-module=/usr/local/module-nginx/headers-more-nginx-module && \
    make -j$(nproc) && \
    make install && \
    mkdir -p /var/log/nginx

# RUN cat <<EOF | tee /etc/yum.repos.d/influxdata.repo
# [influxdata]
# name = InfluxData Repository - Stable
# baseurl = https://repos.influxdata.com/stable/\$basearch/main
# enabled = 1
# gpgcheck = 1
# gpgkey = https://repos.influxdata.com/influxdata-archive_compat.key
# EOF
# RUN yum install -y telegraf

WORKDIR /opt/nginx

EXPOSE 80 443

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
