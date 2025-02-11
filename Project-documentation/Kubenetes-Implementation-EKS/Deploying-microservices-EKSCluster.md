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














