FROM php:8.2-fpm
RUN apt-get update && apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libwebp-dev \
		libzip-dev \
		libxpm-dev \
		libpq-dev \
		libonig-dev \
		libmagickwand-dev \
		net-tools \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
	&& docker-php-ext-install -j$(nproc) gd mbstring zip pdo pdo_mysql pdo_pgsql
RUN pecl install imagick-3.7.0 redis-6.0.2 \
	&& docker-php-ext-enable imagick redis

# Copy custom php.ini (optional)
# COPY ./php.ini /usr/local/etc/php/

# Set working directory
WORKDIR /data/project

# Expose port 9000 (for PHP-FPM)
EXPOSE 9000