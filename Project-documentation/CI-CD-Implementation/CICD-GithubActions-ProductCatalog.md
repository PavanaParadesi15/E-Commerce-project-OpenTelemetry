# Github Actions:

## CI Part

- We create a repo called ".github\workflows" in the project/microservice code directory structure 
- <filename>.yaml file which has call the code to instruct github actions to run the CI pipeline.


- Check the ci.yaml file in .github\workflows 
- There are 4 stages - build, code quality, docker image push , Update K8S manifest (deploy.yaml) for product catalog.


## CD Part

- In CD, it picks up the updated versions of K8S manifests and deploys it on to K8s Cluster (EKS) 

## GitOps - ArgoCD 

- Updated deploy.yaml - K8s manifests with the updated docker image, is stored in version control (Github)
- ArgoCD reads these changes from git and deploy it on to EKS cluster. 
- ArgoCD constantly watches the git repo for the updated image in K8S manifests, whenever new image is updates, it picks it up and deploys on K8s cluster.
- Reconcilation of State - Version control (GIT) is the source of truth . Any other manual changes on to the docker image deployed on to K8s clusster is overwritten to the image version present in the manifests in the GIT , by the ArgoCD.
- No manual abrupt changes are not allowed. State is maintained by ArgoCD. 
- This process of ArgoCD Watching/monitoring git for new image and deploying onto K8s cluster is continuous as per the timeframe we configure. 


## Install ArgoCD 

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Commands to check the ArgoCD deploymments and running

```
kubectl get pods -n argocd
kubectl get svc -n argocd
```

- Edit Type from ClusterIP to LoadBalancer

```
kubectl edit svc argocd-server -n argocd
kubectl get svc argocd-server -n argocd                     // to check if the Type is changed
```

- Type is changed to LoadBalancer 
- Copy the DNS of LB and access ArgoCD through UI. 


Command to get the secret

```
kubectl get secrets -n argocd
kubectl edit secret argocd-initial-admin-secret -n argocd
echo UG9ScVExWlZnenVuS0R2bQ== | base64 --decode
```

- Copy the password in the secret and decode it , as the secrets are base 64 encoded.















