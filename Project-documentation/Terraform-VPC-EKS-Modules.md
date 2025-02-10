Modules are the re-usable code. 

# Create VPC modules
- In this module, I am creating VPC, Public and private subnet. 
- Private subnet is created for K8S cluster, nodes to communicate with each other and for the traffic within the organization we need private subnet.
- Public subnet - For the traffic from the Internet .
- Internet Gateway - Assign public  traffic to IGW . 
- NAT Gateway - For the k8s EKS clusters to communicate to Internet, configure NAT Gateway to private subnet. It does Network Address Translation. Public will not know the subnet private IP address or the nodes Private IP as the IP address is translated. 
- Public subnet is connected to IGW
- Private subnet is connected to NAT Gateway
- Also Route tables (RT) are created - RT is connected to IGW and associated with public subnet .  
- RT is connected with NAT Gateway and associated with private subnet

