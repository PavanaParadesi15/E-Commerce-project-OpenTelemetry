# Terraform - IAC
* Creating AWS EKS through UI , we have to create VPC and its components like subnets, route tables, routes, LB, Internet Gateway etc and EKS CLuster. 
* All this creation takes lot of time. 
* With IAC, we write Infrastructure as Code and can create infra within minutes.
* Terraform is vendor neutral , it works on any cloud. Its just the provider block and resource names we have to change according to cloud. 
* Write Terraform code in VS Code. Terraform code is written in HCL - HashiCorp Language

Useful plugins to write HCL files

* Terraform
* YAML
* GitHub Copilot


# Terraform Lifecycle

# Terraform Lifecycle

Terraform follows a well-defined lifecycle for managing infrastructure as code. The lifecycle consists of several stages that ensure resources are created, updated, or destroyed in a controlled manner.

## 1. **Initialization (`terraform init`)**
- Prepares the working directory for Terraform operations. Initialization is done
- Downloads required provider plugins and modules.
- Configures the backend for storing state files.

## 2. **Planning (`terraform plan`)**
- Once the terraform init is successfull without any errors , next is the terraform plan stage. Its like dry run. 
- Analyzes the existing state and the desired configuration.
- Shows a preview of what actions Terraform will take.
- Helps in reviewing changes before applying them.

## 3. **Application (`terraform apply`)**
- Executes the planned changes to create, update, or destroy resources.
- Stores the updated state in the backend.


# Connect Terraform with AWS to Create AWS Resources

* For the terraform to make API calls / to communicate with AWS, it needs AWS user credentials to authenticate.
* Go to IAM user, Create security credentials, create Access key and Secrect access key and copy to a safe place. 

## 1. **Install AWS CLI**
### On Linux:
- Download and install AWS CLI:
  ```sh
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```
- Verify installation:
  ```sh
  aws --version
  ```

### On Windows:
- Download the installer from [AWS CLI Official Site](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Run the installer and follow the setup instructions.
- Verify installation:
  ```sh
  aws --version
  ```

### On macOS:
- Install using Homebrew:
  ```sh
  brew install awscli
  ```
- Verify installation:
  ```sh
  aws --version
  ```

## 2. **Configure AWS CLI**
- Run the following command to configure AWS credentials:
  ```sh
  aws configure
  ```
- Provide the following details when prompted:
  - AWS Access Key ID
  - AWS Secret Access Key
  - Default region name (e.g., `us-east-1`)
  - Default output format (e.g., `json` or `text`)

**NOTE**: Above command stores AWS credentials in `~/.aws/credentials`, Terraform uses those credentails to interact with AWS.









