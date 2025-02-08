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











