# Install Prequisites

# Install Docker

Follow this link - [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

## Add Docker's official GPG key:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
## Add the repository to Apt sources:
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install Docker
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Verify Docker Installation
```
sudo docker run hello-world
```

## Set permissions for ubuntu user 

Add ubuntu user to docker group without using 'sudo' before every docker command. With this command we are modifying the user and adding the user to a group called Docker.
```
sudo usermod -aG docker ubuntu
```

After giving this command to change permissions, logout and login back to EC2 instance for the permissions to get updated. 

## Docker commands
```
docker ps                 // to list the running container
docker images             // to list the images
```

# Install Kubectl
* Kubectl is K8S command line tool used to interact with k8s API server.
* Kubectl is a utility, a k8s client, to communicate with k8s cluster and API server.

Follow this link - [https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux)

## Install kubectl binary with curl on Linux 
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

## Validate the binary
**Download the kubectl checksum file:**

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```   
**Validate the kubectl binary against the checksum file:**

```
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

## Install kubectl
```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

**Verify the Installation**

```
kubectl version --client                      // gives the client version
kubectl version                               // print client version and server version. server is the k8s cluster API server
```
* So kubectl version is - v1.32.1
* Kubernetes version - v5.5.0



















