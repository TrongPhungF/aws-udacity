# Use Python 3.10 Slim Buster as the base image
FROM python:3.10-slim-buster

# Set the working directory inside the container to /src
WORKDIR /src

# Copy the requirements.txt file from the local ./app directory to /src/requirements.txt in the image
COPY ./app/requirements.txt requirements.txt

# Install dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# Copy the entire contents of the local ./app directory to the current working directory (/src) in the image
COPY ./app .

CMD python app.py