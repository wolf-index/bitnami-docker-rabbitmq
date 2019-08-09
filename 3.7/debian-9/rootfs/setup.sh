#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace
# shellcheck disable=SC1091

# Load libraries
. /libos.sh
. /librabbitmq.sh

# Load RabbitMQ environment variables
eval "$(rabbitmq_env)"

# Ensure RabbitMQ environment variables settings are valid
rabbitmq_validate
# Ensure RabbitMQ is stopped when this script ends.
trap "rabbitmq_stop" EXIT
# Ensure 'daemon' user exists when running as 'root'
am_i_root && ensure_user_exists "$RABBITMQ_DAEMON_USER" "$RABBITMQ_DAEMON_GROUP"
# Ensure RabbitMQ is initialized
rabbitmq_initialize

rabbitmqctl add_user shady 5774057fc19004ea86679643beceee94fcf306830c272e7ad7a5ea4b7d9a49a4
rabbitmqctl set_user_tags shady administrator
rabbitmqctl set_permissions -p / shady ".*" ".*" ".*"
rabbitmqctl set_user_tags guest
