# This is multi stage docker build 
# First stage is to build the go binary by downloading all the dependencies 
# Second stage is to copy the binary to a new image and run it
# Golang base image 

FROM golang:1.22-alpine AS builder

# WORKDIR - It is the directory where the the docker commands are executed
WORKDIR /usr/src/app/

# Use Go build cache for dependencies
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    mkdir -p /root/.cache/go-build

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download go dependency
RUN go mod download

# Copy the source code
COPY . .
# Creates the binary with name : product-catalog
RUN go build -o product-catalog .

####################################
# Multi stage docker build . Use distrolless image which is light weight. 
# This image has zero unwanted binaries/dependencies. When unwanted binaries and shared libraries are reduced, chance of vulnerabilities goes down
# This light weight image has only system dependencies
# This image is based on alpine image which is light weight linux distribution

FROM alpine AS release

WORKDIR /usr/src/app/
# Copy the products folder to the current location
COPY ./products/ ./products/
# copy the binary from the builder image(stage 1) work directory(/usr/src/app) to the current location
COPY --from=builder /usr/src/app/product-catalog/ ./

# Expose product catalog port to 8088
ENV PRODUCT_CATALOG_PORT 8088
# Run the binary
ENTRYPOINT [ "./product-catalog" ]
