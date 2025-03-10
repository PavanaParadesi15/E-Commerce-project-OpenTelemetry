# CI-CD

- CI : Continuous Integration  -- build process
- CD : Continuous Delivery -- Delivery


## CI Part

- For every commit, CI pipeline runs
- CI pipeline checkouts code on a VM, Unit tests run on the code changes in a commit, next static code analysis runs for any syntax issues, for any outdated packages used. 
- Next runs the build process to build the new version of the application, Creates a docker image, scans the docker image. 
- Push the docker image to docker repo like docker hub or ECR 
- Update the image name and version and tag onto K8S manifest files (deploy.yaml) for each microservice.


## CD Part

- Used Gitops tool "ArgoCD" to deploy the docker image to the K8S cluster (EKS) 


- This entire CI / CD process runs on every code commit or Pull Request. Code that goes into the repository is free from all the bugs and vulnerabilites.
 
 
