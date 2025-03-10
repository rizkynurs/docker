# Use Alpine as a base image
FROM unit:1.33.0-php8.2

# Set environment variables for NGINX Unit if needed
# ENV UNIT_SERVICE="app"

# Install any additional dependencies (if needed)
RUN apt-get update && apt-get install -y curl wget netcat-openbsd vim nano telnet net-tools procps bash less \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    libxpm-dev \
    libpq-dev \
    libonig-dev \
    libmagickwand-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libpcre3-dev \
    net-tools \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install gd
RUN docker-php-ext-install -j$(nproc) mbstring zip pdo pdo_mysql pdo_pgsql phar 
RUN docker-php-ext-install -j$(nproc) ctype curl dom  
RUN docker-php-ext-install -j$(nproc) fileinfo filter 
#RUN docker-php-ext-install -j$(nproc) hash openssl pcre 
#RUN docker-php-ext-install -j$(nproc) date session tokenizer xml xmlwriter xmlreader
RUN pecl install imagick-3.7.0 redis-6.0.2 \
	&& docker-php-ext-enable imagick redis

# Hapus direktori unit setiap kali build
# RUN rm -rf /var/lib/unit/

# Expose the ports that NGINX Unit will use (e.g., 8080)
EXPOSE 8080-8085 8300 80 443 9000

# Copy the configuration files for Unit (this could be a Unit JSON config or a directory)
COPY ./conf/* /etc/unit/
# COPY ./conf/ docker-entrypoint.d

# Command to run NGINX Unit
# CMD unitd --no-daemon --statedir /etc/unit/ --control unix:/var/run/control.unit.sock && \
#     curl -X PUT --unix-socket /var/run/control.unit.sock -d @/etc/unit/config.json http://localhost:8080/config
#     curl -X PUT --unix-socket /var/run/control.unit.sock -d @/etc/unit/config-lara.json http://localhost:8081/config