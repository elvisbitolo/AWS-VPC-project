# AWS VPC Project

This repository contains Terraform code to provision an AWS Virtual Private Cloud (VPC) with public and private subnets, an Internet Gateway, a NAT Gateway, and all core networking infrastructure needed for a typical multi-tier cloud application.

## Features

- Custom VPC with configurable CIDR block
- Multiple public and private subnets across Availability Zones
- Internet Gateway for public subnet internet access
- NAT Gateway for secure internet access from private subnets
- Route tables and associations for public/private traffic flows
- Parameterized for easy customization
- Example IAM role and policy for EC2 security

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or newer
- AWS CLI configured with appropriate access ([Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html))
- An AWS account

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/elvisbitolo/aws-vpc-project.git
   cd aws-vpc-project
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Review and customize variables**
   - Check `variables.tf` for configuration options (VPC CIDR, subnets, AZs, etc.)
   - Optionally override variables using a `terraform.tfvars` file or CLI flags.

4. **Plan and apply**
   ```bash
   terraform plan
   terraform apply
   ```

5. **Destroy infrastructure**
   ```bash
   terraform destroy
   ```

## Example `terraform.tfvars`

```hcl
vpc_cidr         = "10.0.0.0/16"
public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
azs              = ["us-east-1a", "us-east-1b"]
```

## IAM Security

- The provided `iam.tf` creates an example IAM role and instance profile for EC2, allowing read-only access to S3.
- Attach or customize IAM policies as needed for your application.
- NEVER hard-code AWS credentials in Terraform files.

## Files

- `main.tf` — Main Terraform configuration for AWS networking resources
- `variables.tf` — Input variables for easy customization
- `outputs.tf` — Useful output values after deploy
- `iam.tf` — Example IAM role, policy, and instance profile for EC2
- `.gitignore` — Excludes Terraform state and sensitive files

## Notes

- Make sure your AWS credentials allow creating networking resources (VPC, subnets, gateways, etc.)
- Costs may apply for NAT Gateway, Elastic IPs, and other AWS resources.

## License

MIT License
