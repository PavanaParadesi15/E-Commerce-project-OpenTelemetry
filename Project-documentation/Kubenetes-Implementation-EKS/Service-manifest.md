# Service Manifest - service.yaml

Service manifests starts with 

```
- **apiVersion:**v1
  **kind:** Service
 ** metadata:**
    **name:** name of the service 
    **labels:** provide labels for this service
  **spec:** It is important part of service
   **type:** type of service (ClusterIP, NodePort, Load Balancer service type) 
   **ports:** service port (not container port) . Pod talks to the service with the service name. <servicename>:serviceport
     -port: 8080
      name: tcp-service
      targetPort: 8080     // container port mentioned in deployment.yml for this resource
   **selectors:** 
     label name - same as the label in deployment.yaml resource
```

- **ClusterIP service type** - used for internal traffic within the organization to connect to cluster
- **LoadBalancer type service** - used for the external traffic to connect to service. for external access.
- **Selectors** - service identifies pod using its labels, but for the service to know which label it should look for, In the service.yaml we specify a field called Selector in which we give the same label name which is specified in pod deployment.yaml configuration template.
- So for the service using the information provided in selector, it knows which label it should look for the pod and identify. 









