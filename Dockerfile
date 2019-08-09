FROM rabbitmq:3.7
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management

RUN rabbitmqctl add_user shady 5774057fc19004ea86679643beceee94fcf306830c272e7ad7a5ea4b7d9a49a4
RUN rabbitmqctl set_user_tags shady administrator
RUN rabbitmqctl set_permissions -p / shady ".*" ".*" ".*"
RUN rabbitmqctl set_user_tags guest

#EXPOSE 1883
EXPOSE 15672
EXPOSE 15675
EXPOSE 25672
