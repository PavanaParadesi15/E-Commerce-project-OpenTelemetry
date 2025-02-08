
# Containerize microservices 

I am picking some of the microservices to build and containerize them using docker. 

# 1. Product-Catalog Service

* This service is written in Go programming language. 
* On the linux VM , navigate to the project repo -> src -> product-catalog 
* Run the binary locally 
* Export the product catalog service to a unique port 

```
export PRODUCT_CATALOG_PORT=<any-unique-port>            // I am running on port - 8088
```

## Install Go
```
sudo apt install golang-go
go --version
```

# Build the service locally
* Go language has dependencies to download which are mentioned in "go.mod" file  
* This is similar to different dependency files in different programming languages like 
python --- requirements.txt
Maven --- pom.xml 

```
go build -o product-catalog . 
``` 
-o --> destination 
product-catalog is the binary name

## Run the binary 
```
./product-catalog
```

# Docker build

## Create Docker file 
* I built multi stage docker file using distroless image

### **Stage 1: Build Stage (Builder Image)**  
This stage is responsible for **compiling the Go application** in an optimized manner.  

1. **Use a Minimal Go Base Image**  
   - The `golang:1.22-alpine` image is used for building the application.  
   - Alpine is a lightweight Linux distribution that helps reduce image size.  

2. **Set the Working Directory**  
   - The working directory inside the container is set to `/usr/src/app/`.  

3. **Enable Go Build Cache**  
   - `--mount=type=cache,target=/go/pkg/mod` caches Go modules to speed up dependency management.  
   - `--mount=type=cache,target=/root/.cache/go-build` caches compiled build artifacts for efficiency.  
   - This helps avoid unnecessary re-downloading and recompiling.  

4. **Copy Go Module Files**  
   - The `go.mod` and `go.sum` files are copied to ensure dependencies are managed correctly.  

5. **Download Dependencies**  
   - `go mod download` fetches all required dependencies before copying the entire source code.  

6. **Copy the Rest of the Source Code**  
   - The entire Go project is copied into the container.  

7. **Build the Go Application**  
   - `go build -o product-catalog .` compiles the Go application and outputs an executable binary.  

---

### **Stage 2: Runtime Stage (Final Image)**  
This stage creates a **minimal runtime environment** for running the compiled Go binary.  

1. **Use a Minimal Alpine Base Image**  
   - The `alpine` image is used to keep the final image size as small as possible.  

2. **Set the Working Directory**  
   - The working directory remains `/usr/src/app/`.  

3. **Copy Required Files from the Build Stage**  
   - The `./products/` directory is copied (likely containing static data or configurations).  
   - The compiled `product-catalog` binary from the `builder` stage is copied to the final image.  

4. **Set Environment Variables**  
   - `PRODUCT_CATALOG_PORT` is set to `8088`, defining the port the service will listen on.  

5. **Define the Entry Point**  
   - The container executes `./product-catalog`, starting the Go microservice.  

---

### **Summary**  
- The **first stage** compiles the Go microservice efficiently with caching mechanisms.  
- The **second stage** runs the built application in a **lightweight, production-ready environment**.  
- Using **multi-stage builds** ensures that the final image contains only what is needed, making it **small, secure, and optimized** for production.  


## Build Docker image
```
docker build -t pavanap5/product-catalog:v1 .                 // pavanap5  is my docker hub repo name
docker images | grep pavanap5                            // check the created docker image
```  

## Run the docker image as container
```
docker run pavanap5/product-catalog:v1
```
This is output we get after running this container
```
time="2025-02-08T15:31:58Z" level=info msg="Loaded 10 products"
time="2025-02-08T15:31:58Z" level=info msg="Product Catalog gRPC server started on port: 8088"
```




