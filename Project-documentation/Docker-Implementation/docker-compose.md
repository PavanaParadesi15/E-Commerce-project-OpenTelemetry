# Docker Compose 
## The need of Docker Compose
* There is a over-head of running many individual containers each for docker network, to create volumes for DB, to pull docker images from centralized docker hub registry, and run containers. 
* So to avoid running these many commands , docker-compose came up, where we create a single file called "docker-compose.yml" which has all the steps to run the docker environment and run multiple containers at a time. 

## 3 steps for Docker-compose.yml file
* Within the docker-compose.yml file there are 3 parent objects

## **1. Services**  
- In services, we define how to pull and run the microservice images
- Services define **containers** in the Docker Compose setup.  
- Each micro service represents a different part of an application (e.g., database, backend, frontend).  

### **What Goes Into Services?**  
- **Image**: The Docker image to use.  
- **Build**: If no image exists, specify how to build it.  
- **Ports**: Expose container ports.  
- **Environment**: Define environment variables.  
- **Depends_on**: Set service dependencies. In this, we define on which containers this particular microservice is dependent on

---

## **2. Networks**  
- It creates network for all the microservices to communicate with each other. All the services are placed in common network
- Networks allow **containers to communicate** with each other.  
- Containers in the same network **can talk** using service names.  

### **What Goes Into Networks?**  
- **Driver**: Defines the network type (e.g., bridge, overlay).  
- **Attachable**: Allows external containers to join.  

---

## **3. Volumes**  
- Define how to create volumes
- Volumes store **persistent data** outside the container.  
- Even if a container stops, the data remains.  

### **What Goes Into Volumes?**  
- **Named Volumes**: Shared storage between containers.  
- **Bind Mounts**: Maps a host directory to a container path.  

---

## **Summary**  
- **Services** define containers and how they run.  
- **Networks** enable communication between containers.  
- **Volumes** store data that persists before container restarts.  

With Docker Compose, you can **easily manage multi-container applications**!   

* Docker-compose.yml file is present at root of the entire project or root of all the microservices.


# Docker compose commands
```
docker compose up -d              // -d : to run the logs at the background
docker compose down               // to kill the containers
``` 
