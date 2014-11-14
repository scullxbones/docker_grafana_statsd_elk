#!/bin/bash

export DATABASE_URL="postgres://docker:docker@localhost:5432/docker"
export CELERY_BROKER_URL="redis://redis.snapito.prod.comp.ezd:6379/1"
# export SES_HOST="$MAIL_EXIM_HOST"
# export SES_USER=""
# export SES_PASS=""
# export SES_PORT="225"

service nginx restart &&\
python manage.py collectstatic --noinput &&\
python manage.py compress --force &&\
python manage.py syncdb --noinput && \
python manage.py migrate && \
python manage.py loaddata fixture.json &&\
gunicorn wsgi:application --config gunicorn.conf &\
celery worker -B -A app.cabotapp.tasks --loglevel=INFO --concurrency=16 -Ofair
