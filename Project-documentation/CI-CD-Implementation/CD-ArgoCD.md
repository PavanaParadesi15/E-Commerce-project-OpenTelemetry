# ArgoCD Installation

https://argo-cd.readthedocs.io/en/stable/

## Deploying ArgoCD as K8s manifest

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

- First create namespace for ArgoCD 
- Then run YAML file within the namespace.
- This will deploy ArgoCD components (server, repo server, application controller, Redis, etc.) into the argocd namespace.

```
kubectl get pods -n argocd
kubectl get svc -n argocd                              // displays the  services of Argocd

```

- argocd-server : Is the User INterface of ArgoCD which hosts the Argocd

```
kubectl edit svc argocd-server -n argocd
```
- Change the type fromm ClusterIP to LoadBalancer. It will create LoadBalancer for ArgoCD
- Use the LB address to access the ArgoCD UI, and confirue it with github repo where k8s manifests are present. 
- It continuously watches for the updated deployments and deploy it on to EKS cluster. 

### Login to ArgoCD

```
kubectl get secrets -n argocd
```
- We can find "argocd-initial-admin-secret" 

```
kubectl edit secret argocd-initial-admin-secret -n argocd
```
- Copy the password .

```
echo password | base64 --decode            // displays the password for argocd Login
```

Username = admin

- Argocd need not to be on the same EKS cluster, it can be on the centralized location/cluster if there are multiple clusters.


## Last step - confuguring gitrepo in Argocd

- As the final step, we have to configure github repo where the k8s deployment files are present for the automatic deployment onto EKS clusters. 


- We might get an error , saying " Failed Scheduling " - It means there are too many pods  running on the EKS cluster, no enough space on the cluster. We can fix this by adding more resources/space to the EKS cluster. 

