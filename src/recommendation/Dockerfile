# Pull base image , using slim image - bookworm image
FROM python:3.12-slim-bookworm AS base
# define the working directory
WORKDIR /usr/src/app
# copy requirements.txt to the docker file current directory
COPY requirements.txt ./
# Install dependencies using pip install
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# copy source code to the docker file current directory
COPY . .

RUN opentelemetry-bootstrap -a install 
# give env variable , run this service on port 1010
ENV RECOMMENDATION_PORT 1010

ENTRYPOINT ["python", "recommendation_server.py"]
