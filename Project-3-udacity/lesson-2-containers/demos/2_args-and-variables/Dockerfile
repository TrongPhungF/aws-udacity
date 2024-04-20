# Use Python 3.10 Slim Buster as the base image
FROM python:3.10-slim-buster

ARG BUILD_NUMBER

RUN echo "import os" > /say_something.python
RUN echo "print('Build number :BUILD_NUMBER')" >> /say_something.py
RUN echo "print(os.getenv('WORDS'))" >> /say_something.py

ENTRYPOINT python /say_something.py
