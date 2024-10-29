
## Here's a README file for creating the VPC, subnets, instances, internet gateway, NAT gateway, and associated Terraform code for deployment in AWS. It also covers storing the Terraform code on GitHub.

AWS VPC, Subnets, Instances, and Gateways Setup using Terraform

This project sets up a Virtual Private Cloud (VPC) on AWS, with public and private subnets distributed across availability zones (AZs) in the ap-south-1 region. The setup includes instances in each subnet, an internet gateway for public internet access, and a NAT gateway to allow outbound internet traffic from instances in the private subnets. The infrastructure is defined using Terraform, and the code can be stored and managed via GitHub.


# Architecture Diagram


![Copy of Untitled Diagram drawio](https://github.com/user-attachments/assets/eb435444-9ae7-41bc-b4d0-c9ad000979a0)


Create a simple text or graphical representation of the architecture, illustrating:

VPC: Central element with CIDR 192.168.0.0/26.

Subnets: Public and private subnets across AZs ap-south-1a and ap-south-1b.

Instances: Represented within the public and private subnets.

Gateways: Internet Gateway attached to the VPC and NAT Gateway within the public subnet.



# Architecture Overview

## VPC:

CIDR Block: 192.168.0.0/26


#### Subnets:

Public Subnet (AP-South-A1): 192.168.0.0/26
Public Subnet (AP-South-A2): 192.168.0.64/26
Private Subnet (AP-South-A1): 192.168.0.128/26
Private Subnet (AP-South-A2): 192.168.0.192/26


#### Instances:

Public instance in ap-south-a1:
 Assigned to 192.168.0.0/26

Private instance in ap-south-a2: 
Assigned to 192.168.0.128/26


#### Gateways:

Internet Gateway: Attached to the VPC for public subnets


#### NAT Gateway:

 Placed in the first public subnet (192.168.0.0/26) to enable private subnet access to the internet.


# Prerequisites

## AWS CLI:

 Install AWS CLI and configure it using aws configure.
 To install and configure the AWS CLI, follow these steps:

#### Step 1: Install the AWS CLI

On macOS (using Homebrew):
Open Terminal.

#### Run:

brew install awscli
On Linux:
Open Terminal.


#### Run:
 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


#### On Windows:

Download the AWS CLI MSI installer for Windows from AWS CLI Downloads.
Run the installer and follow the prompts.

#### To confirm installation, type:

aws --version

### Step 2: Configure the AWS CLI

Run the following command in your terminal:

aws configure

# You’ll be prompted for four details:

##### AWS Access Key ID: Enter your Access Key ID.

##### AWS Secret Access Key: Enter your Secret Access Key.

##### Default region name: Enter the default region for your AWS resources, e.g., us-west-2.

##### Default output format: Choose the default format (json, text, or table). The default is json.

After configuration, the credentials will be saved in ~/.aws/credentials, and your default region and output settings will be saved in ~/.aws/config.

# Step 3: Test the Configuration

 Run a simple command to verify:

aws s3 ls

This will list your S3 buckets if the configuration was successful.


#### Terraform:

 Install Terraform and ensure it’s accessible from your PATH.


#### Git:

 Install Git for version control and GitHub integration.



# Project Setup

#### Clone the Project:


git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name


### Terraform Code Structure:

Here's a structured example for configuring Terraform files to create a VPC with the IP address 192.168.0.0/26, public and private subnets across two AZs, instances, an internet gateway, and a NAT gateway in AWS. This includes files for separating out configurations and credentials.

# File Structure

.
├── main.tf

├── variables.tf

├── ami.tf

├── aws_credentials.tf

├── .terraformignore


# Explanation of Resources

VPC: Created with CIDR 192.168.0.0/26.

Subnets: Two public subnets (192.168.0.0/26 and 192.168.0.64/26) and two private subnets (192.168.0.128/26 and 192.

168.0.192/26) are created across two AZs (ap-south-1a and ap-south-1b).

Internet Gateway: Provides internet access for public subnets.

NAT Gateway: Allows instances in private subnets to access the internet.

Route Tables: Public route table is associated with the public subnets, and a private route table with a NAT route is associated with the private subnets.

Instances: EC2 instances are created in both the public and private subnets.

## Replace "ami-0abcdef1234567890" with the AMI ID for the region you are working in.


# Terraform Configuration

#### Step 1: Initialize the Terraform Project

terraform init

#### Step 2: Review and Apply Changes

Plan the Infrastructure: Check what resources will be created.

terraform plan


#### Apply the Infrastructure: Create resources on AWS.

terraform apply


#### Step 3: Verify Resources

After running terraform apply, verify the following:
The VPC is created with CIDR 192.168.0.0/26.
Public and private subnets are created as specified.
Instances are deployed in the respective subnets.
Internet gateway is attached to the VPC, and a NAT gateway is created in the public subnet.
Storing the Project on GitHub
Create a Repository on GitHub:


### Repository link to push the Project to GitHub:

Go to GitHub and create a new repository.
Add Remote Repository:

git remote add origin https://github.com/yourusername/your-repo-name.git

Push the Project to GitHub:

### How to push repository on Github.com:

git add .
git commit -m "Initial commit - VPC and Subnets setup using Terraform"
git push -u origin main



# How to destroy terraform resource:

terraform destroy

Resource Cleanup
To avoid incurring unnecessary costs, you can delete the infrastructure using:
Below is a simple example of the main.tf code to create a VPC, subnets, instances, internet gateway, and NAT gateway in AWS.


#### Troubleshooting

Terraform Errors: Ensure your AWS credentials are correctly set and the CLI can access your account.

Resource Limits: If AWS imposes limits (e.g., IP allocation), ensure your configurations fit within your quota.

Public IP Access: Ensure security groups allow inbound traffic for public instance access.


### This README file should provide all necessary steps to set up the specified AWS infrastructure, deploy it using Terraform, and store the code in GitHub.