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












