# Multi stage docker build
# FIRST STAGE 
###############################################################33

# JDK base image
FROM eclipse-temurin:21-jdk AS builder
# Choose work directory where the docker file commands gets executed
WORKDIR /usr/src/app/

## This is the first step which is to download the dependencies
# download dependencies and copy gradlew files to /usr/src/app directory (.)
COPY gradlew* settings.gradle* build.gradle .
# copying gradle folder 
COPY ./gradle ./gradle
# Add execute permissions to gradle wrapper 
RUN chmod +x ./gradlew
# Run gradle wrapper to download dependencies
RUN ./gradlew
RUN ./gradlew downloadRepos

## This is the second step which is to build the application
# Copy the source code to the container
COPY . .
# Copy the proto files in the ./pb folder to ./proto files
# Grant execution permissions to gradlew
# Run gradle wrapper to build the application
COPY ./pb ./proto
RUN chmod +x ./gradlew
RUN ./gradlew installDist -PprotoSourceDir=./proto

# Second stage of docker build
#####################################################
# Image is light in nature with less vulnerabilities
# This is just jre image without jdk files so its light weight
FROM eclipse-temurin:21-jre

WORKDIR /usr/src/app/
# From previous stage builder, copy everything from the working directory(/usr/src/app/) to the current working directory(/usr/src/app/)
COPY --from=builder /usr/src/app/ ./
# Provide environment variable - ad service port as 9099
ENV AD_PORT 9099

ENTRYPOINT ["./build/install/opentelemetry-demo-ad/bin/Ad"]

