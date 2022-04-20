FROM python:3.10

WORKDIR /app

COPY src .

RUN pip install flask

ENV FLASK_APP=hello  

CMD flask run --host=0.0.0.0 --port=5001
