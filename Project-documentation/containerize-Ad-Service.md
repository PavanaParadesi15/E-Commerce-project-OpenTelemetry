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














