# Containerize Ad-Service
* This microservice is written in Java and is built using Gradlew.
* The Ad service provides advertisement based on context keys. If no context keys are provided then it returns random ads.

# Build this service locally
## Install Java
```
sudo apt install openjdk-21-jre-headless
```
**Check permissions for Gradlew wrapper**
```
./gradlew
```
**If the permission is denied add execute permissions to gradlew wrapper**
```
chmod +x gradlew
```
## Build the binary
```
./gradlew installDist
```
* This command starts gradlew deamon which is a server , installs dependencies, performs compilation, build the application .
* Creates a build directory

## To run the Ad Service:
```
export AD_PORT=9099
export FEATURE_FLAG_GRPC_SERVICE_ADDR=featureflagservice:50053
./build/install/opentelemetry-demo-ad/bin/Ad              // within the bin dir, executable and jar file is present
```

# Containerize the Java microservice using Docker
# Build the service the Docker way
## Create Docker file
I built multi stage docker file using distroless image

### Stage 1: Build Stage (Builder Image)

This stage is responsible for building the Java application using Gradle.

#### 1. Use a JDK Base Image
* The eclipse-temurin:21-jdk image is used as the build environment.
* This includes the necessary Java Development Kit (JDK) to compile the application.

#### 2. Set the Working Directory
The working directory inside the container is set to /usr/src/app/.

#### 3. Copy Essential Gradle Files
* The gradlew, settings.gradle, and build.gradle files are copied to the container.
* The gradle wrapper directory is also copied to ensure Gradle can be executed inside the container.

#### 4. Set Execution Permissions for Gradlew
The chmod +x ./gradlew command ensures the Gradle wrapper script has execution permissions.

#### 5. Initialize Gradle and Download Dependencies
* ./gradlew runs the Gradle wrapper, setting up necessary configurations.
* ./gradlew downloadRepos ensures that required repositories are downloaded to speed up the build.

#### 6. Copy the Application Source Code
* The entire project source code is copied to the container.
* The pb directory is copied into the container as proto (likely for protocol buffer files).

#### 7. Build the Application
* ./gradlew installDist -PprotoSourceDir=./proto compiles and packages the Java application.
* The -PprotoSourceDir=./proto flag specifies the location of protocol buffer files.

### Stage 2: Runtime Stage (Final Image)

This stage creates a lightweight, optimized runtime image for running the application.

#### 1. Use a Minimal JRE Base Image
The eclipse-temurin:21-jre image is used since it contains only the Java Runtime Environment (JRE), reducing the final image size.

#### 2. Set the Working Directory
The working directory remains /usr/src/app/.

#### 3. Copy the Built Application from the Builder Stage
The compiled application from the builder stage is copied into the final image.

#### 4. Set Environment Variables
The AD_PORT environment variable is set to 9099.

#### 5. Define the Entry Point
* The application is executed with ./build/install/opentelemetry-demo-ad/bin/Ad.
* This is the compiled and installed binary from the Gradle installDist task.

### Summary

* The first stage builds the application using Gradle.
* The second stage runs the built application inside a lightweight JRE-based image.
* Using multi-stage builds ensures that the final image only contains what is necessary for execution, making it smaller, more secure, and optimized for production use.

## Docker commands to build and run docker image
```
docker build -t pavanap5/adservice:v1 .
docker run  pavanap5/adservice:v1 .
```





















