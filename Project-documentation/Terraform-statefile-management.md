# Terraform Statefile: The Brain of Terraform

## **What is a Terraform Statefile?**
- Terraform maintains a statefile (`terraform.tfstate`) that records information about managed/created infrastructure.
- It acts as the single source of truth for Terraform and helps track resource mappings between Terraform configurations and real-world infrastructure.
- If there is any update in the terraform code for a particular resource which is already created, with the state file terraform understands, that resources is already created and just performs the updates on that resource. 

## **Why is the Statefile Important?**
- **Tracking Resources:** Terraform uses the statefile to understand which resources it manages/created.
- **Performance Optimization:** Instead of querying cloud providers every time, Terraform reads from the statefile to improve performance.
- **Dependency Management:** It helps Terraform determine resource dependencies and execution order.


