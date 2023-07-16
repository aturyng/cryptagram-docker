FROM python:3.11.4-alpine

# Preventing python from writing
# pyc to docker container
ENV PYTHONDONTWRITEBYTECODE 1

# Flushing out python buffer
ENV PYTHONUNBUFFERED 1

WORKDIR /app
ADD ./backend/requirements.txt /app/backend/


RUN pip install --upgrade pip
RUN pip install gunicorn
# Installing dependencies
RUN pip install --no-cache-dir -r ./backend/requirements.txt

ADD ./backend /app/backend
ADD ./docker /app/docker