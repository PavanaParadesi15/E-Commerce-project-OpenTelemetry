
# Run project locally on the linux VM using Docker compose which is installed as part of docker installation
```
docker compose                  // checks if the docker compose is installed
```

## Why Docker Compose 
* In this e-commerce project it has front-end, back-end and databases. Inside frontend and backend there are many microservices. 
* To run this large project with all the microservices locally, it is preferred to run using Docker compose. 
* Docker compose can run multiple containers at a time and establish dependencies between them.
* Like, first DB container should start and then the backend and then frontend containers should start. 
* Using Docker compose we can create images, run containers, create network, create volumes within a docker lifecycle. 
* Docker compose can be used in CI/CD pipelines.

## To run application on Linux VM 
* Clone the repository from github. All the images for each migroservice is built and stored in docker registry. No need to build the images 
* Use Docker compose command to build the containers for all the microservices. 


### Error - No space left on Device 
* This error occurs when there is no disk space left on the VM. We have to resize the volume and resize the file system as well. 

```
df -h                    // command to check the disk size
``` 

* Go to EC2 instance volume and increase the volume size to 30GB(mmodify disk)  and then resize the file system. File system won't automatically get update after modifying the volume. 

```
lsblk                   // to see blocks available on this VM
sudo apt install cloud-guest-utils               
sudo growpart /dev/xvda 1
sudo resize2fs /dev/xvda1                // to resize the file system       
```  
## Allow Inbound access to EC2 instance
* Allow port 8080 on EC2 instance security group. By default it is blocked. 

Once the containers are running, we can access the application using 
ec2instance-publicip:8080 

![image](https://github.com/user-attachments/assets/4a9866ba-5882-407e-abfc-22db54c44047)


# Docker Lifecycle.
* As a Devops Engineer we containerize the microservices. Containerization is done in 3 stages
1. Setting up Docker file
2. Build Docker Image
3. Run Container









