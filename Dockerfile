FROM redis:3-alpine

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 5000 6379

VOLUME ["/data"]

CMD ["/start.sh"]
