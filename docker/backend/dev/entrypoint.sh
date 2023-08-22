#!/bin/sh

until cd /app/backend
do
    echo "Waiting for server volume..."
done

until ./manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done

python3 ./manage.py collectstatic --noinput

#gunicorn messenger_project.wsgi --bind 0.0.0.0:8000 #--workers 4 --threads 4
./manage.py runserver 0.0.0.0:8000