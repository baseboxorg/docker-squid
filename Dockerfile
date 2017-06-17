FROM alpine:3.5

COPY docker-entrypoint.sh /
RUN apk update &&\
    apk add --no-cache su-exec &&\
    apk add --no-cache squid acf-squid && \
    mkdir -p /var/cache/squid &&\
    chmod +x /docker-entrypoint.sh
COPY conf/squid.conf /etc/squid/squid.conf
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
