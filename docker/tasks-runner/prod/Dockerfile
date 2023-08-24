# Dockerfile to create image with cron services
FROM ubuntu:latest

#Install Cron
RUN apt-get update
RUN apt-get -y install cron curl

# Add the script to the Docker Image
ADD remove_expired_messages.sh /root/remove_expired_messages.sh

# Give execution rights on the cron scripts
RUN chmod 0644 /root/remove_expired_messages.sh

# Add the cron job
RUN crontab -l | { cat; echo "* * * * * bash /root/remove_expired_messages.sh"; } | crontab -