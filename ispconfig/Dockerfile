# Aktuelles Debian
FROM debian:bookworm
ENV DEBIAN_FRONTEND=noninteractive

# Basis-Pakete + PHP-FPM + Nginx
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    nginx \
    php8.2-cli php8.2-fpm php8.2-mysql php8.2-gd php8.2-curl php8.2-mbstring \
    php8.2-xml php8.2-bcmath php8.2-imap php8.2-zip \
    wget unzip sudo vim supervisor mariadb-client curl nano cron \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /usr/local/ispconfig

# ISPConfig herunterladen
RUN wget -O ispconfig.tar.gz https://www.ispconfig.org/downloads/ISPConfig-3.2.11.tar.gz && \
    tar xzf ispconfig.tar.gz --strip-components=1 && \
    rm ispconfig.tar.gz

# Supervisor für PHP-FPM + Cron
COPY ispconfig-supervisord.conf /etc/supervisor/conf.d/ispconfig.conf
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY config.inc.php /usr/local/ispconfig/interface/lib/config.inc.php

# ISPConfig server config files
COPY server/lib/config/security.conf /usr/local/ispconfig/server/lib/config/security.conf
COPY server/lib/config/ispconfig.conf /usr/local/ispconfig/server/lib/config/ispconfig.conf
COPY server/lib/config/mysql_clientdb.conf /usr/local/ispconfig/server/lib/config/mysql_clientdb.conf

# Nginx Config Volume wird über Docker-Compose eingebunden
EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

