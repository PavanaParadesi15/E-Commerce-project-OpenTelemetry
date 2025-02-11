# Kubernetes Implementation

After creating EKS Cluster through Terraform scipts, when we try to see the EKS Cluster nodes from the EC2 instance using kubectl, it does not show any resources.

- I gave "kubectl get nodes" command to see the Cluster nodes created.

![image](https://github.com/user-attachments/assets/1387b980-538f-4a05-93a1-bcd8db45ebb1)


- This is the error it throws. Because by default Kubectl will not know what is the EKS cluster. 
- Kubectl depends on the file called 'KubeConfig' 
- In the KubeConfig file we can provide the list of clusters present. All the information about the clusters is updated in this file.
- Using the 'context' in the KubeConfig' file, Kubectl understands to which clusters it is connected. 
- We can modify the context and kubectl updates accordingly. 

#### Kubeconfig is null 

![image](https://github.com/user-attachments/assets/0d64e4d5-e2d4-4f09-aa50-f77570f5ea8a)

## Commands
```
kubectl config view
kubectl config current-context               // shows the list of K8S clusters present and we can select which cluster/context should kubectl connect to
kubectl config use-context <context-name>      // kubectl connects to mentioned context. 
```

## How to update KubeConfig with EKS Cluster Information.               
- This is the command to update kube config with the EKS cluster details
```
aws eks update-kubeconfig --region ap-south-1 --name my-eks-cluster              
```
This is the output it gives after the update
```
Added new context arn:aws:eks:ap-south-1:831926586509:cluster/my-eks-cluster to /home/ubuntu/.kube/config
```

- After updating kube config, If we want to check the eks cluster details, we can give this command
```
kubectl config view            // gives all the details of the EKS cluster
kubectl config current-context        // gives the current context , i.e, context of the current EKS cluster and its region
```

```
kubectl get nodes              

NAME                                       STATUS   ROLES    AGE    VERSION
ip-10-0-1-28.ap-south-1.compute.internal   Ready    <none>   107m   v1.30.8-eks-aeac579
ip-10-0-2-63.ap-south-1.compute.internal   Ready    <none>   107m   v1.30.8-eks-aeac579
```

This is the process to connect kubectl to EKS cluster


# What are the K8S tasks I would perform for this project Implementation

1. What is Service Account and why we need service account?
2. Deployment of pods
3. Service discovery
4. How to deploy this project / micro services on to EKS cluster.
5. How to expose this application to external users using Load Balancer service type. 
6. Difference between LB service type and Ingress.
7. Deploy Ingress, Ingress controller and access the application from web. 
8. How to get a custom domain?
9. How to integrate this domain with Ingress using AWS Route53. 
10. How to access application using this domain















