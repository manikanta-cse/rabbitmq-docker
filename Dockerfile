FROM rabbitmq:3

ADD rabbitmq_init.sh /usr/local/bin/rabbitmq_init.sh

EXPOSE 15672
EXPOSE 5672

CMD ["/usr/local/bin/rabbitmq_init.sh"]