# List of all the K8s Commands

## Pods

```
kubectl get pods
kubectl get pods -o wide                                 // To see complete info of the pods
kubectl get pods -n argocd                           // To see pods in argocd namespace
kubectl get pods -n kube-system                            // to see the alb pods
```

```
kubectl config current-context       // to check if kubectl connected to EKS cluster
kubectl get all                      // shows all the available deployments
kubectl get namespaces               // shows all the namespaces
```

## Deployments

```
kubectl get deploy                                // Lists all the deployments present in the EKS cluster
kubectl describe deploy <deployment_name>         // Shows/Describes all the info about the deployment
kubectl apply -f deployment.yaml                  // Apply the deployment file
```

## Replica Sets

```
kubectl get rs                                    // Displays all the replica sets on the EKS cluster
kubectl edit rs <replica-set-name>                // Can edit the replica set
```

## Service

```
kubectl get svc                                  // Displays list of services
kubectl edit svc <svc-name>                      // Edit the svc
kubectl apply -f service.yaml                 // apply a service
kubectl get svc -n argocd                        // to see the services in argocd namespace
```

## Service Account

```
kubectl get sa                             // shows the service account in default namespace
kubectl get namespaces                     // shows all the available namespaces
kubectl get sa -n kube-system              // shows service accounts in 'kube-system' namespace
kubectl apply -f serviceaccount.yaml         // create a service account
```

## Ingress

```
kubectl apply -f ingress.yaml
kubectl get ing
```

## Namespaces
```
kubectl get namespaces
```





