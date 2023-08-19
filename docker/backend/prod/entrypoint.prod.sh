#!/bin/sh


if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

until ./manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done

python3 ./manage.py collectstatic --noinput

exec "$@" #executes command