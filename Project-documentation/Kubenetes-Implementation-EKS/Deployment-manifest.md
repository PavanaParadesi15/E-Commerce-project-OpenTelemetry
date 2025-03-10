# Deployment.yaml file

It has following parameters 

```
1. apiversion: app/v1 
2. kind: Deployment            // specify the kind of service
K8s has different types of services like Deployment, Service, ingress, config map, custom resources etc. 
3. metadata: 
    name: name of the microservice
    labels:  for identification of microservices. Labels should be unique. This labels are not used for service discovery. 
    annotations 
4. spec : In spec we write about replicas, replica set needs this info to auto scale and heal pods.
     replicas: replica count
     Template :- pod related configuration is defined in template
      spec: within spec we have pod information
     metadata :- In metadata we put labels which is used by service discovery.
       labels: labels should be unique for the pod so that service can discover the pod based on labels. This labels of pod are used for service discovery.
     spec : 
        serviceAccountname: 
        containers: container configuration
         -name: name of container
          image: name of the container image name
          ports : on what port this container runs
          env: environment variables
          volumes: volume configuration 

```

- So in the deployment.yaml file, there is 
- **apiVersion, kind, metadata** (within metadata there is name of **microservice and labels**). 
- After metadata, There is **spec** (within spec, **there is replicas and labels and selectors**)
- **Within spec** there is **template which has pod configuration**. we define **metadata in template for service discovery**. 
- In the spec, **inside template**, we **define service account name , and containers configuration**.
- Container configuration has name of container, image for the microservice to run on this container, ports container runs, environment variables and volume information.
- The labels in the deployment are not important for Service Discovery. The labels of the POD play critical role in service discovery.
- Deployment only creates important controller called "Replica Set" which creates the pods.














