FROM python:3.12

WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "kpaas_rest.asgi:application"]
