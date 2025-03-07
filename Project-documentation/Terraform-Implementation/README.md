## **Terraform directory Structure:**

**1. Providers.tf:** 

- Provide AWS provider details in providers.tf

**2. Resource blocks**
- Seperate resource blocks for each resource we are creating in AWS. These blocks have code related code to these AWS modules, and these are re-usable. 
- Like EC2, S3, RDS, VPC, Security Groups etc. 

**3. Variables.tf:**

- Pass variables to resource blocks as well as root terraform modules/main.tf. 

**4. Terraform.tfvars:**

- Pass values to the variables mentioned in variables.tf .

**5. Outputs.tf:**

- Defines the output blocks for the outputs we want to see after terraform execution. Like EC2 ip address etc.




