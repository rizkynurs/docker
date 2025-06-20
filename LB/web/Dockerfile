FROM alpine:3.14

ENV openssl=1.1.1o
ENV nginx=1.22.1

#Install dependencies for Nginx and PHP
RUN apk update && apk add --no-cache build-base \
    tzdata \
    supervisor \
    shadow \
    vim \
    nano \
    netcat-openbsd \
    wget \
    mariadb-dev \
    python3 \
    python3-dev \
    unzip \
    bzip2-dev \
    postgresql-dev \
    bind-tools \
    libffi-dev \
    git \
    gcc \
    net-tools \
    curl \
    pcre \
    mtr \
    pcre-dev \
    libxml2 \
    htop \
    libxml2-dev \
    iproute2 \
    curl-dev \
    openssh-client \
    chrony \
    geoip-dev \
    dcron \
    cmake \
    geoip \
    zlib-dev \
    make \
    openssl \
    openssl-dev \
    davfs2 \
    lua-dev \
    autoconf \
    bison \
    re2c \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    #libiconv-dev \
    libcurl \
    curl-dev \
    sqlite-dev \
    oniguruma-dev \
    icu-dev \
    libxslt-dev \
    gmp-dev \
    imap-dev \
    openldap-dev \
    freetype-dev \
    gd-dev && \
    cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    echo "Asia/Jakarta" > /etc/timezone && \
    #################################################
    # Create a user and group for Nginx and PHP-FPM #
    #################################################
    useradd -r -u 500 -g www-data -s /sbin/nologin www-data && \
    ####################################################
    # Create directories and Install for Nginx Modules #
    ####################################################
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
ENV TZ=Asia/Jakarta
# Install PHP 8.2
ENV php_ver=8.2.20
ENV redis_ver=6.0.2

WORKDIR /sources
RUN wget https://www.php.net/distributions/php-${php_ver}.tar.gz && \
    tar -xzvf php-${php_ver}.tar.gz && \
    cd /sources/php-${php_ver} && \
    ./configure    --prefix=/opt/php82   --enable-gd=/usr/lib64/   --with-png   --with-jpeg   --with-freetype   --with-webp   --with-xpm   --with-zlib   --enable-sysvshm   --with-openssl   --with-pgsql   --enable-soap   --with-curl   --with-libdir=/usr/lib64/   --enable-pcre-regex   --enable-xml   --enable-session   --with-json   --with-hash   --enable-cli   --with-iconv   --enable-simplexml   --enable-ctype   --enable-filter   --enable-ftp   --enable-xmlreader   --enable-phar   --with-pear   --enable-fpm   --enable-dom   --enable-pdo   --enable-mbstring   --enable-exif   --enable-bcmath   --enable-fileinfo   --with-pdo-mysql   --with-pdo-pgsql   --with-zip   --enable-mysqlnd   --with-mysqli   --with-libxml   --enable-sockets   --enable-opcache   --enable-intl --enable-mbstring && \
    make ; make install

WORKDIR /sources
RUN wget https://pecl.php.net/get/redis-${redis_ver}.tgz; tar zxvf redis-${redis_ver}.tgz && \
    cd /sources/redis-${redis_ver} && \
    /opt/php82/bin/phpize && \
    ./configure --with-php-config=/opt/php82/bin/php-config && \
    make -j$(nproc) && \
    make install

# Add PHP to PATH (optional)
# ENV PATH="/opt/php82/bin:/opt/php82/sbin:$PATH"

COPY ./opt/php82/php.ini /opt/php82/lib/
COPY ./opt/php82/php-fpm.conf /opt/php82/etc/
COPY ./opt/php82/php-fpm.d/* /opt/php82/etc/php-fpm.d/
RUN chown -R www-data:www-data /opt/php82/var/

RUN cat <<EOF | tee /etc/supervisord.conf
[unix_http_server]
file=/var/run/supervisor.sock

;[inet_http_server]
;port=*:9001
;username=root
;password=nimda    

[supervisord]
nodaemon=true
logfile=/var/log/supervisord.log
logfile_maxbytes=50MB      
logfile_backups=10         
loglevel=info              
pidfile=/var/run/supervisord.pid 
nodaemon=false             
minfds=1024                 
minprocs=200                
;umask=022                  
;user=chrism                
;identifier=supervisor      
;directory=/var/run             
;nocleanup=true              
;childlogdir=/var/run            
;environment=KEY=value       
;strip_ansi=false            

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock
;serverurl=http://127.0.0.1:9001 
;username=chris             
;password=123                
;prompt=mysupervisor         
;history_file=~/.sc_history  

[include]
files = /etc/supervisord.d/*.ini

EOF

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/php 
RUN mkdir -p /var/log/nginx
RUN mkdir -p /etc/supervisord.d
RUN chown -R www-data:www-data /var/log/php

RUN cat <<EOF | tee /etc/supervisord.d/nginx.ini
[program:nginx]
command=/opt/nginx/sbin/nginx -c /opt/nginx/conf/nginx.conf -g "daemon off;"
process_name=%(program_name)s
numprocs=1
directory=/opt/nginx/conf
umask=022
priority=1
autostart=true
autorestart=true
startsecs=1
startretries=1
exitcodes=0,2
stopsignal=TERM
stopwaitsecs=5
serverurl=AUTO
redirect_stderr=true
stdout_logfile=/var/log/supervisor/nginx.log
stderr_logfile=/var/log/supervisor/nginx-err.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stdout_capture_maxbytes=1MB

EOF

RUN cat <<EOF | tee /etc/supervisord.d/php82.ini
[program:php82]
command=/opt/php82/sbin/php-fpm
process_name=%(program_name)s
numprocs=1
directory=/opt/php82
umask=022
priority=1
autostart=true
autorestart=true
startsecs=1
startretries=1
exitcodes=0,2
stopsignal=QUIT
stopwaitsecs=5
serverurl=AUTO
user=www-data
group=www-data
redirect_stderr=true
stdout_logfile=/var/log/supervisor/php82.log
stderr_logfile=/var/log/supervisor/php82-err.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stdout_capture_maxbytes=1MB

EOF

RUN touch /var/log/supervisor/php82.log /var/log/supervisor/php82-err.log && \
    chown www-data:www-data /var/log/supervisor/php82.log /var/log/supervisor/php82-err.log

#RUN supervisorctl update

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

EXPOSE 80 443 8080 9001

#CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
