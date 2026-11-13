# Terraform — Infrastructure as Code Projects

## Overview

Hands-on Terraform projects focused on automating AWS infrastructure provisioning, EC2 configuration, and application deployment.

These projects demonstrate my progression from defining basic AWS resources to automating web server configuration and deploying WordPress.

## Tools & Technologies

- **Terraform** — Infrastructure as Code
- **AWS** — Cloud infrastructure
- **Amazon EC2** — Virtual servers
- **Cloud-init** — Automated instance configuration
- **Bash** — Server initialization scripts
- **Nginx and Apache** — Web servers
- **MariaDB and PHP** — WordPress dependencies
- **Git and GitHub** — Version control and documentation

## Projects

### 1. [EC2 + Cloud-init + Nginx](terraform-ec2-cloud-init/README.md)

**What I did**
- Defined an AWS EC2 deployment using Terraform.
- Automated Nginx installation and configuration using cloud-init.
- Verified the deployed web server in a browser.

**What changed**

Replaced manual server provisioning and configuration with a repeatable Terraform and cloud-init deployment.

**Result:** Successfully deployed and verified a working Nginx web server.

### 2. [Automated WordPress Deployment](terraform-aws-wordpress/README.md)

**What I did**
- Provisioned AWS infrastructure using Terraform.
- Used Bash user data to install and configure Apache, MariaDB, PHP, and WordPress.
- Troubleshot deployment and initialization issues.
- Verified the WordPress website was accessible.

**What changed**

Automated both the infrastructure provisioning and the application installation process.

**Result:** Successfully deployed WordPress on AWS and verified the website in a browser.

### 3. Terraform EC2 Modules Lab

**What I did**
- Practiced organizing Terraform configuration into a root module and a reusable EC2 child module.
- Worked with module configuration and input variables.

**What changed**

Organized EC2 infrastructure code into reusable components rather than defining everything in one configuration file.

**Files:** `main.tf`, `provider.tf`, and `modules/ec2/`.

## Key Skills Demonstrated

- Infrastructure provisioning with Terraform
- AWS resource configuration
- Reusable Terraform modules
- Automated server initialization
- Bash scripting for application deployment
- Terraform state and infrastructure lifecycle management
- Troubleshooting and deployment verification

## Security and Repository Practices

- Exclude Terraform state files and local variable files from version control.
- Exclude downloaded provider directories.
- Track Terraform source files and provider lock files.
- Keep credentials and sensitive configuration values out of committed source code.

## Next Step

Apply these infrastructure automation skills to an AWS ECS Fargate deployment, integrating Docker, Terraform, networking, and GitHub Actions.