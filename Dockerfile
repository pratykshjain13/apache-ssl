FROM httpd:2.4

RUN sed -i \
    's/^#LoadModule ssl_module/LoadModule ssl_module/' \
    /usr/local/apache2/conf/httpd.conf && \
    sed -i \
    's/^#LoadModule socache_shmcb_module/LoadModule socache_shmcb_module/' \
    /usr/local/apache2/conf/httpd.conf && \
    sed -i \
    's/^#Include conf\/extra\/httpd-ssl.conf/#Include conf\/extra\/httpd-ssl.conf/' \
    /usr/local/apache2/conf/httpd.conf

COPY ssl/server.crt /usr/local/apache2/conf/server.crt
COPY ssl/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/index.html

COPY ssl.conf /usr/local/apache2/conf/extra/ssl-custom.conf

RUN echo "Include conf/extra/ssl-custom.conf" >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80 443

CMD ["httpd-foreground"]
