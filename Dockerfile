# Specifying Base Image
FROM python:apline

# Installing Dependencies

WORKDIR .django_polls/dist

COPY ./ ./

RUN python -m pip install --user ./mysite/django-polls/dist/django-polls-0.1.tar.gz

CMD ["python" ,"./mysite/manage.py","runserver","0:8000"]
