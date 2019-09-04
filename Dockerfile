FROM ubuntu:16.04
MAINTAINER Kamal Chauhan "kmlchauhan@gmail.com"

RUN apt-get update -y
RUN apt-get install -y apache2 php php-mysql libapache2-mod-php php-xml php-mbstring php-apcu php-intl imagemagick inkscape php-gd php-cli php-curl git
RUN apt-get -y install git curl wget tree vim

ENV MEDIAWIKI_MAJOR 1.31
ENV MEDIAWIKI_MINOR 0

#ADD http://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR}/mediawiki-${MEDIAWIKI_MAJOR}.${MEDIAWIKI_MINOR}.tar.gz /tmp/
#RUN tar -xvzf /tmp/mediawiki-*.tar.gz && mkdir /var/lib/mediawiki && rm -rf /tmp/mediawiki-*.tar.gz && mv mediawiki-*/* /var/lib/mediawiki

RUN mkdir /var/lib/mediawiki 

COPY ./mediawiki /var/lib/mediawiki

RUN ln -s /var/lib/mediawiki /var/www/html/mediawiki

RUN phpenmod mbstring
RUN phpenmod xml

CMD apachectl -D FOREGROUND
