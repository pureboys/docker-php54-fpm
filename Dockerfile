FROM debian:wheezy
LABEL maintainer="Oliver lin <linbin@smzdm.com>"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& { \
echo deb http://mirrors.163.com/debian/ wheezy main non-free contrib; \
echo deb http://mirrors.163.com/debian/ wheezy-updates main non-free contrib; \
echo deb http://mirrors.163.com/debian/ wheezy-backports main non-free contrib; \
echo deb-src http://mirrors.163.com/debian/ wheezy main non-free contrib; \
echo deb-src http://mirrors.163.com/debian/ wheezy-updates main non-free contrib; \
echo deb-src http://mirrors.163.com/debian/ wheezy-backports main non-free contrib; \
echo deb http://mirrors.163.com/debian-security/ wheezy/updates main non-free contrib; \
echo deb-src http://mirrors.163.com/debian-security/ wheezy/updates main non-free contrib; \
} | tee /etc/apt/sources.list

RUN apt-get update && apt-get install -y php5-cli \
    php5-fpm \
	php-apc \
	php5-exactimage \
	php5-ffmpeg \
	php5-gdcm \
	php5-vtkgdcm \
	php5-mapscript \
	php5-adodb \
	php5-geoip \
	php5-imagick \
	php5-memcache \
	php5-memcached \
	php5-ps \
	php5-radius \
	php5-rrd \
	php5-sasl \
	php5-svn \
	php5-tokyo-tyrant \
	php5-curl \
	php5-enchant \
	php5-gd \
	php5-gmp \
	php5-imap \
	php5-interbase \
	php5-intl \
	php5-ldap \
	php5-mcrypt \
	php5-mysql \
	php5-odbc \
	php5-pgsql \
	php5-pspell \
	php5-recode \
	php5-snmp \
	php5-sqlite \
	php5-sybase \
	php5-tidy \
	php5-xmlrpc \
	php5-xsl \
	php5-librdf \
	php5-remctl \
	php5-xdebug \
	php5-redis \
	php5-mongo

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

COPY ./conf/www.conf /etc/php5/fpm/pool.d/www.conf

CMD ["php5-fpm"]

WORKDIR /web


