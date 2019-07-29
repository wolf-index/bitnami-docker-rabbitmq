FROM rabbitmq:3.7
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management
EXPOSE 1883
EXPOSE 15672
EXPOSE 15675
EXPOSE 25672
