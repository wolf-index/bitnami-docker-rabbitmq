FROM rabbitmq:3.7

RUN rabbitmqctl add_user "${RABBITMQ_USERNAME}" "${RABBITMQ_PASSWORD}"
RUN rabbitmqctl set_permissions -p / "${RABBITMQ_USERNAME}" ".*" ".*" ".*"
RUN rabbitmqctl set_user_tags "${RABBITMQ_USERNAME}" management
RUN rabbitmqctl delete_user guest
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management
EXPOSE 1883
EXPOSE 15672
EXPOSE 15675
EXPOSE 25672
