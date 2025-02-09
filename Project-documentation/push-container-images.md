
# Push Docker Images to centralized Artifactory/Registry - Docker Hub

## Login to the Container registry

### To login to Docker Hub - Docker container Registry
```
docker login docker.io
```

### To login to ECR
```
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
```
## Push Docker Image

```
docker images | grep pavanap5             // shows al the images created with the dockerhub registry username
docker push docker.io/pavanap5/product-catalog:v1 
docker push docker.io/pavanap5/adservice:v1
docker push docker.io/pavanap5/recommendation-service:v1        
``` 

* Within the docker hub registry, with the username "pavanap5" , its creating new repository called product-catalog/adservice/recommendation-service and respective images with version v1 are pushed. 
* colon (:) is the version of the image.








