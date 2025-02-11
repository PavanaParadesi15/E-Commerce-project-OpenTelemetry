# Deployment

### Performs Scaling and Healing of Pods. 

- Docker containers were used in local environments to deploy the microservices. 
- But  docker containers are not feasible solution to use in production deployments , as the containers are ephermal in nature , means containers are short lives and can down and up anytime. 
- So everytime the container goes up and down, its IP address changes and accessing the application/microservice is the problem. 
- So K8S is used as it can overcome this by scaling up the new pods whenever a pod is down. 
- 2 important reason we are using K8S is  
    1. Scaling and Healing mechanism of K8S
    2. Service Discovery
- Deployment takes care of Scaling Healing of k8s pods
- Service Discovery is taken care by Service Resource of K8s. 

# Scaling & Healing

- For the docker containers, if there is no 'restart policy' for the container, if it goes down, it does not auto restart/come up automatically.
- There is no auto scaling and auto healing for the containers. 
- During the peak time, we will need multiple copies of the containers and LB to balance the load. 
- There is no auto scaling  up and scaling down for the containers.

- **So these 2 features of scaling and healing is taken care by Deployment in K8S**
- Using deployment resource, we can deploy the microservices in k8s. 
- The lowest level of deployment in k8s in "POD" , which is similar to container in docker.
- A pod can be a single container or multiple containers. 
- Pod holds the microservice. 
- While deploying a microservice on to a pod, we create the deployment service (deployment.yml) for that microservice, and deployment resource further  creates a intermediate resources called "Replica Set" where we can define the number of replicas the pod should have or the microservice deployment should have. 
- Replica set spins up/down the pods based on the count we specify in the deployment.yml . 
- Replica set always makes sure the count of the pods is achieved/running, as mentioned and so it solves the "Auto Healing" issue. Auto Healing is implemented.
- Replica set is a controller in K8S. 



















