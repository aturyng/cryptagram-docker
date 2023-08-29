#!/bin/sh

until cd /app/src
do
    echo "Waiting for server volume..."
done

until ./manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done

python3 ./manage.py collectstatic --noinput

./manage.py runserver 0.0.0.0:8000