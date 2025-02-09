# Docker vs Kubernetes

# What problems does Docker solve?
* Docker solved the major issue of "application works on my machine but not on yours" in the IT Industry.
* Docker packages the application as a Docker Image (its a encapsulation of code and its dependencies) and stores in the centralized Container repositories like docker hub and AWS ECR. 
* Anyone can pull this docker image and run it as container and it works fine anywhere.

# Why is the Need of Kubernetes?

## 1. Containers Are Ephemeral

* Docker runs containers, but containers are temporary and can stop anytime. If a container crashes, Docker does not restart it automatically.
* Once the container restarts, the IP address of the container changes. In this that particular microservice or the application connection fails due to the IP change. 
* This problem is called "Service Discovery"

## How Kubernetes Helps

Kubernetes monitors containers and restarts them if they fail. It ensures that the required number of containers always stay running.

## 2. Issues Related to Service Discovery

Docker containers get random IPs, making it hard to connect services. If a container restarts, its IP might change, breaking communication.

## How Kubernetes Helps

Kubernetes assigns a fixed DNS name to each service. Containers can communicate using service names instead of IPs.

## 3. Issues Related to Scaling and Healing

* In Docker, you manually create and remove containers when demand changes. If a container crashes, it must be restarted manually. 
* And docker cannot not handle well the production environment of auto scaling, disaster recovery.
* So we need container orchestration engine which is K8s.

## How Kubernetes Helps

Kubernetes automatically scales containers up or down based on demand. If a container crashes, Kubernetes heals by replacing it automatically.



# Docker Compose vs Kubernetes 

## Docker compose
* Docker compose is a run-time execution platform for the containers, it can run multiple containers parallely. 
* We can define run-time environment of multiple containers in a single yaml file :- docker-compose.yml
* With just one docker compose command " docker compose up", we can create network for all multiple containers to communicate, spin up the volumes and run multiple containers.
* with " docker compose down" command we can tear down all the running containers.

## Kubernetes
* Kubernetes is the container orchestration platform , which helps to run many containers in production seamlessly.
* It address critical problem of "Service Discovery"
* It comes with clustering, supports high availability, supports load balancing












