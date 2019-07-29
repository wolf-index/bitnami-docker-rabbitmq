FROM rabbitmq:3.7
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt
EXPOSE 1883
EXPOSE 15672
EXPOSE 25672
