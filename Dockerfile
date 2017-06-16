FROM alpine:3.5

VOLUME ["/data"]

COPY docker-entrypoint.sh /
COPY conf/squid.conf /etc/squid/squid.conf

RUN apk --update --no-cache add su-exec squid acf-squid && \
    rm -fr /var/cache/squid && \
    ln -sf /data /var/cache/squid && \
    rm -fr /var/cache/apk/* \
    /tmp/* \
    /root/.cache \
    /root/.cached && \
    chmod +x /docker-entrypoint.sh
    

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
