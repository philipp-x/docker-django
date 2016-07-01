#!/bin/sh

# Waiting for RabbitMQ
until nc -z rabbitmq 15672; do
    sleep 1
done

# Waiting for Redis
until nc -z redis 6379; do
    sleep 1
done

su -m whoami -c "celery -A docker_django worker -B -l info"