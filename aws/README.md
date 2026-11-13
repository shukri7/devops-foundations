# AWS Infrastructure & Networking Projects

## Overview

Hands-on AWS labs focused on networking, compute infrastructure, and distributing web traffic across multiple EC2 instances.

These projects demonstrate practical experience configuring AWS services, understanding infrastructure components, and verifying results.

## Projects

### 1. [AWS VPC Networking Lab](vpc/README.md)

**Technologies:** Amazon VPC, Internet Gateway, Route Tables, AWS Management Console

- Worked with a custom AWS VPC.
- Attached an Internet Gateway to the VPC.
- Created and inspected a custom route table.
- Practiced understanding network routing and connectivity.

**Outcome:** Verified the Internet Gateway attachment and custom route table creation.

### 2. [AWS Application Load Balancer](load-balancer/README.md)

**Technologies:** Amazon EC2, Application Load Balancer, VPC Networking, Security Groups

- Deployed two EC2 web servers across different Availability Zones.
- Configured an Application Load Balancer.
- Routed HTTP requests through a single ALB endpoint.
- Verified responses from both backend web servers.

**Outcome:** Successfully demonstrated HTTP traffic reaching two EC2 instances through the same load balancer.

## Technical Skills Practiced

- AWS networking and routing fundamentals
- EC2 provisioning and management
- Application Load Balancer configuration
- Multi-Availability Zone deployments
- Security group fundamentals
- Infrastructure troubleshooting and verification

## Lessons Learned

These projects strengthened my understanding of how AWS networking, compute, and load balancing work together.

The VPC lab focused on the underlying networking components, while the load-balancer project demonstrated how application traffic can be distributed across multiple web servers.

Both projects provided foundational experience for later infrastructure automation using Terraform and container deployment using Amazon ECS.