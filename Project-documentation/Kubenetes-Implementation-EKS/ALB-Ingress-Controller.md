# OIDC Connector:
- ALB controller is deployed inside the EKS cluster, as a pod running inside it.
- It creates Elastic Load Balancer. But how can ALB controller deployed inside EKS cluster , can create a resource(ELB) within AWS. 
- To create any resource in AWS, we need to assign IAM role to the service account of ALB Contoller which want to perform this action,  and IAM policy with certain permissions should be attached to it.
- The ALB controller pod inside the cluster has the Service Account, this service account should be binded to IAM role and policy to create ELB in AWS. 
- This binding is provided by IAM OIDC Provider. We will connect service account with IAM role with IAM OIDC Provider.

## Setup OIDC Connector

### Commands to configure IAM OIDC provider

```
export cluster_name=<eks-cluster-name>
```

- Get EKS cluster OIDC ID
 
```
oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5) 
echo $oidc_id                       // OIDC ID is stored in "oidc_id" variable.
```

- Associate OIDC provider with the cluster. Adding OIDC provider to the cluster

```
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
```

## Next steps

### 1. Create a IAM policy with permissions to create ELB in AWS.

#### Download IAM policy 

```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json
```
#### Create the IAM policy with all the permissions to ELB

```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```


### 2. Create IAM role, attach that to the service account of ALB controller

#### Create IAM role

This creates the iam service account for ALB controller and maps it with the IAM role "AmazonEKSLoadBalancerControllerRole"

```
eksctl create iamserviceaccount \
  --cluster=<your-cluster-name> \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```


## Install Helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### Add helm repo for EKS

```
helm repo add eks https://aws.github.io/eks-charts
```

#### Update the repo

```
helm repo update eks
```

### Install ALB Controller through Helm

```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \            
  -n kube-system \
  --set clusterName=<your-cluster-name> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=<region> \
  --set vpcId=<your-vpc-id>
```

Check if the ALB controller containers are running

```
kubectl get pods -n kube-system
```

#### Delete the Previously created Load Balancer by changing the service type from LoadBalancer to NodePort

```
kubectl edit svc opentelemetry-demo-frontendproxy
```


















