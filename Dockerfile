FROM alpine:3.5

COPY docker-entrypoint.sh /
COPY conf/squid.conf /etc/squid/squid.conf

RUN apk update && \
    apk add --no-cache su-exec squid=3.5.23-r0 acf-squid && \
    mkdir -p /var/cache/squid && \
    chmod +x /docker-entrypoint.sh
    
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
