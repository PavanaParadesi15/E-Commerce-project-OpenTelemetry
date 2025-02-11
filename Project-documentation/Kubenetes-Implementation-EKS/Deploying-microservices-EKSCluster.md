# Deploying all the microservices to EKS cluster

Commands 

```
kubectl config current-context       // to check if kubectl connected to EKS cluster
kubectl get all                      // shows all the available deployments
kubectl get namespaces               // shows all the namespaces
```

## Step 1 - Create Service Account

```
kubectl apply -f serviceaccount.yaml
kubectl get sa                               // Displays the service accounts
``` 

- This command creates a service account called - Opentelemetry-demo

## Step 2 - Apply all the deployments

- Apply all the deployment and service.yaml files of all the microservices. 
- Navigate to each microservice folder and give below command to apply manifests

```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

- This is time consuming to go to each microservice and apply each manifest file. 
- So I created a single deployment file (with a merge of code from all the deployment and service.yaml files) 

```
kubectl apply -f complete-deploy.yaml
```

- All the services and deployments are created for all the microservices.
- After execution of this , check the pods which are created.

```
kubectl get pods               // displays the pods created for all the microservices
kubectl get svc               // displays the services created for all the microservices
```

- One microservice is connected to another microservice, with the service name mentioned in environment variables in the deployment.yaml file for each microservice.

## Access the application

- If we try to access the front end we cannot access it using clusterIP and the port 8080. Because, EKS cluster is inside the VPC . 
- The nodes of EKS cluster are only connected to private subnet. 
- There is public subnet, where there is Internet Gateway 

# Service types

- For the users to access the application (Group of microservices) the service type should be external.
- There are 3 types of service types 

## 1. ClusterIP type : 
- Cluster Ip allows only service-service and pod-pod connection within the cluster.
- Inside the VPC, we created EKS cluster with multiple nodes(EC2 instances) using IAC Terraform
- Inside the nodes, pods are deployed, each microservice is deployed in each pod. 
- There is service created for each pod.
- Whenever a EKS cluster is created, it creates a internal network which is Cluster Network using CNI - Container Network Interface.
- Internal network is not accessible to other AWS resources within the VPC and not inside the EKS cluster.
- Only pods and services inside EKS cluster can access each other, as they are inside the EKS cluster.
- ClusterIP service type is extremely secure and can be used for services that should not be accessed by anyone, service with sensitive information. 

## 2. Node Port service type:
- We can change the "service type" inside the service.yaml from clusterIP to NodePort mode.
- K8s API service, creates a new port for that service , which we changed type to Nodeport. 
- We can access that particular microservice whose type is changed to node port using "<nodeIP address>:nodeport"
- This process of changing type to nodeport , can be done for all the microservices deployed on pods. 
- So NodePort type allows access to nodeIP address with the special port created. 
- Anybody who have access to this node / Ec2 instance and access the service and pods deployed inside that node using node IP address. 


## 3. Load Balancer service type:
- For the external users to access the pods inside the nodes in the EKS cluster,  we need service type -Load Balancer. 
- We can change the type in the service.yaml to Load Balancer. 
- Once it is done, API server talks to a "**Cloud Controller manager**" (CCM) component inside the control plane. 
- CCM communicates with AWS to create LB.
- AWS creates Load Balancer for this purpose. 
- Using LB Endpoint, external users can access the application / microservice






















