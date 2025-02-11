# Service 

It solves the critical problem in the world of containers called **"Service Discovery"** 

### Problem: 
- When using containers, whenever a container goes down, its IP address is changed, and users cannot access the microservice deployed in the container as its IP address is changed, and we have to manually update the IP address in the environment variable. 
- So this creates a problem of "Service Discovery"

### K8S address this problem using Services

- Unlike Containers, Deployment service which is created by writing deployment.yml, solves only auto scaling healing problem of pods/containers. 
- So even after using deployment service and the Replica set created by deployment, whenever a pod goes down, replica set automatically spins up the new pod, always maintaining the count of the pods we specified in the deployment.yml file. There is no manual intervention in this senario. 
- But, Even in this case, the new pod which spins up , its IP address can be changed and users cannot access the microservice deployed on this pod. 
- So to solve this issue, comes the "service"/ "Service discovery". 
- Service Discovery communicates / identifies the pods based on "Label and Selectors" concept not on the IP address of it. Even when the pod goes down and comes up automatically with the help of replica set and deployment and the IP address of it is changed, Service can identify/recognize the pod using its "**Label**".
- Everytime Service can identify the Pod using its Labels and Selectors. 
- Using service, Users can access a pod, using domain name of the service. Service communicates with the pod using labels & Selectors.

#### Example :- 
- If there is Frontend pod and backend pod, There can be a service deployed between them and both the frontend and backend pods does not communicate with eachother directly.
- Instead they communicate with Service. Frontend environment file will have env variable of the service name, service acts like proxy . 
- Frontend communicates with service and service constantly looking for the backend pod based on the labels and selectors.

- In this way Service Discovery problem is solved.












