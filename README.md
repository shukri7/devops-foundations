# Shukri I.

DevOps and Cloud Engineer focused on AWS infrastructure, Infrastructure as Code, CI/CD automation, Linux, and containerized applications.

This repository showcases hands-on engineering projects covering cloud infrastructure, automated provisioning, container orchestration, networking, and deployment workflows.

---

## 🚀 Featured Projects

### 1. AWS Infrastructure & Networking

Deployed and configured AWS infrastructure covering compute, networking, load balancing, and web server operations.

**Stack:** AWS EC2, VPC, Application Load Balancer, Security Groups, Ubuntu, NGINX, DNS

**Implementation**
- Provisioned Ubuntu EC2 instances and configured NGINX web servers.
- Configured VPC networking, subnets, routing, and security controls.
- Deployed two EC2 instances behind an Application Load Balancer to distribute incoming HTTP traffic.
- Configured SSH and HTTP access using Security Groups.
- Connected a custom domain using DNS A records and troubleshot connectivity issues.

**Outcome:** Established accessible cloud-hosted web services with load-balanced infrastructure and configured network security.

[View AWS Projects](./aws/)

### 2. Terraform — Infrastructure as Code

Automated AWS infrastructure provisioning and application configuration using Terraform and cloud-init.

**Stack:** Terraform, AWS EC2, Bash, Cloud-init, S3, Linux

**Implementation**
- Provisioned EC2 infrastructure with automated NGINX installation using Terraform and cloud-init.
- Built a WordPress deployment configuration consisting of nine AWS resources.
- Automated Apache, MariaDB, PHP, and WordPress installation through Bash user-data scripts.
- Worked with Terraform modules, S3 remote state, and infrastructure drift detection.
- Troubleshot availability zone configuration and cloud-init execution issues.
- Verified deployed infrastructure and performed controlled resource teardown.

**Outcome:** Created repeatable infrastructure configurations with automated server provisioning, state management, and verified deployment workflows.

[View Terraform Projects](./terraform/)

### 3. Docker — Containerized Applications

Built multi-container applications using Docker Compose, with reverse proxy routing, service networking, scaling, and persistent storage.

**Stack:** Docker, Docker Compose, Python, Flask, MySQL, Redis, NGINX

**Implementation**
- Containerized Flask applications using Dockerfiles and multi-stage builds.
- Configured a Flask and MySQL environment using Docker Compose.
- Built a Flask, Redis, and NGINX visitor counter application.
- Configured NGINX as a reverse proxy and scaled Flask to three replicas.
- Implemented Docker networking for internal service communication.
- Configured persistent Redis storage using Docker volumes.

**Outcome:** Ran interconnected containerized services with shared application state, reverse proxy routing, and three Flask replicas.

[View Docker Projects](./docker/)

### 4. CI/CD — GitHub Actions

Implemented automated workflows for container builds and infrastructure validation.

**Stack:** GitHub Actions, YAML, Docker, Terraform

**Implementation**
- Configured a GitHub Actions workflow to build and push Docker images.
- Implemented Terraform CI validation to check infrastructure configuration.
- Defined workflow triggers, jobs, steps, and runner configurations.
- Executed workflows and verified successful runs.

**Outcome:** Established working CI automation for container image builds and Terraform configuration validation.

[View CI/CD Projects](./cicd/)

---

## 🧰 Technical Stack

| Category | Technologies |
|---|---|
| Cloud Infrastructure | AWS EC2, VPC, ALB, Security Groups, DNS |
| Infrastructure as Code | Terraform, Cloud-init, S3 Remote State |
| CI/CD | GitHub Actions, YAML |
| Containers | Docker, Docker Compose |
| Operating Systems | Linux, Ubuntu |
| Scripting | Bash, Python |
| Networking | TCP/IP, DNS, HTTP, SSH, Subnets, Routing, NAT |
| Web & Databases | NGINX, Flask, Redis, MySQL, MariaDB |
| Version Control | Git, GitHub |

---

## 📂 Repository Structure

| Directory | Description |
|---|---|
| [Linux](./linux/) | Linux administration, permissions, processes, and troubleshooting |
| [Bash](./bash/) | Shell scripting, CLI utilities, and automation |
| [Git](./git-labs/) | Branching, merging, conflict resolution, and version control |
| [Networking](./networking/) | Network fundamentals and EC2 web server deployment |
| [AWS](./aws/) | EC2, VPC networking, and load balancing |
| [Docker](./docker/) | Containerized applications, networking, and scaling |
| [Terraform](./terraform/) | AWS provisioning, automation, modules, and remote state |
| [CI/CD](./cicd/) | GitHub Actions workflows for Docker and Terraform |

---

## Engineering Focus

- **Infrastructure Automation:** Repeatable AWS provisioning and configuration management using Terraform.
- **CI/CD:** Automated build workflows and infrastructure validation with GitHub Actions.
- **Containerization:** Multi-container applications, service networking, reverse proxies, and persistent storage.
- **Cloud Networking:** VPC configuration, routing, security controls, load balancing, and DNS.
- **Troubleshooting:** Diagnosing deployment failures, service connectivity, configuration issues, and infrastructure drift.

---

## Connect

**LinkedIn:** [Shukri I.](https://www.linkedin.com/in/shukri-igal/)

Project directories contain source code, infrastructure configurations, automation scripts, technical documentation, and deployment evidence.
