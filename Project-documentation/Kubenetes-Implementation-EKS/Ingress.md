# Ingress
- Ingress refers to incoming traffic. 
- K8S has a resource of kind Ingress. In the ingress resource, we can define routing rules for the incoming traffic to the cluster.
- LB can communicate with external world can access the LB DNS name and LB sends the user requests to the microservice deployed on the pod. 

- The application should not be used on the IP address, it should be accesible through the Domain name only. 
- For this to achieve, define the routing rules using Ingress resource.
- In the Ingress resource, create a ingress LB, and when the external users try to access the application through domain name then only the request should be forwarded to LB and the LB should be accessed.
- According to the configuration given in the Ingress resource which is yaml file, The Ingress controller reads this yaml file, and it creates LB.
- We define the path in the ingress resource, which is Path based routing
- Create a Ingress resource ingress.yaml for the Frontend proxy. 

### Ingress.yaml

apiVersion:

kind:

metadata:
  name: 
  annatotations:
spec: 
  rules:
    host:
    http:
      path:
      backend:
        service: 


- Ingress resource is tied to the service. we should definitely provide the service
- We create Ingress resource for only services that needs internet access/external access. Not for all microservices.
- In this case we create Ingress.yaml for only "Frontend Proxy" which needs external access.  along with deployment and service.yaml. 
- For all other microservices, we create only deployment and service.yaml


**Pod ----> Deployment resource -----> Service resource ------> Ingress resource (to customize the incoming traffic to the pod)**

## Ingress Controller
- We can deploy any ingress controller based on the Ingress LB we need to have.
- If we want to have ALB - Application Load Balancer, we need to have ALB Ingress Controller.
- Ingress controller by default watches the Ingress resource (ingress.yaml) then it will create LB according to the resource.
- I am deploying ALB LB for the frontend proxy, for that I am deploying ALB controller and a ingress resource for the frontend proxy service. 
 




