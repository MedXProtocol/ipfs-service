FROM debian:latest

RUN apt-get update

RUN apt-get -y install cron

RUN apt-get -y install certbot

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

ADD run.sh /etc/certbot/run.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# CMD ["cron", "-f"]

CMD ["/etc/certbot/run.sh"]
