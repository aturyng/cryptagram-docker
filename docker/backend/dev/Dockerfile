FROM python:3.11.4-slim

# Preventing python from writing
# pyc to docker container
ENV PYTHONDONTWRITEBYTECODE 1

# Flushing out python buffer
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

WORKDIR /app/config

COPY entrypoint.sh .

WORKDIR /app/src