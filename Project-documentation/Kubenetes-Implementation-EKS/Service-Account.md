# Service Account
- We should create a Service Account and assign it to a Pod. Pod should have a service account. 

## What is service account?

- There is User account and service account
- User account :- As a user we can connect to K8S CLuster UI using kubectl and can access it. 
- Service account:-  Same as User account, Service account is for services like 'Pod'. Every service should have service account to perform certain actions on K8S cluster. 
- Like, a pod is a microservice or the application has to be deployed on to K8S cluster. So it needs service account to perform this action. This is the permission for this pod. 

## Commands to check Service accounts
```
kubectl get sa                             // shows the service account in default namespace
kubectl get namespaces                     // shows all the available namespaces
kubectl get sa -n kube-system              // shows service accounts in 'kube-system' namespace
```

- When we don't specify a service account for a pod, kubectl allocated the "default" service account (its name is "default") for the pod with default permissions like that pod can run on K8S cluster.
- We can add extra permissions to the service account by creating new "roles/cluster role" and bind this role to Service account using "cluster role binding".
- These extra permissions are required, if the pod has to access K8S API's etc , service account needs elevated permissions, which are added to the roles created for the Service account. 











