# AWS NGINX Web Server Project

## Project Overview

This project demonstrates deploying a public web server on AWS using Ubuntu and NGINX and connecting it to a custom domain using DNS.

## Live URL

- http://nginx.shukriigal.com

## What I Built

- Launched an Ubuntu EC2 instance on AWS.
- Connected to the instance using SSH.
- Configured Security Groups to allow SSH (22) and HTTP (80) traffic.
- Installed and configured NGINX.
- Purchased a custom domain (`shukriigal.com`) through IONOS.
- Created a DNS A record to map `nginx.shukriigal.com` to the EC2 public IP address.
- Verified that the NGINX welcome page is publicly accessible over the internet.

## Architecture

```text
Internet
   ↓
nginx.shukriigal.com
   ↓
IONOS DNS (A Record)
   ↓
AWS EC2 Public IP
   ↓
Ubuntu Server
   ↓
NGINX
```

## Commands Used

```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx

curl localhost
curl http://44.220.145.181
```

## Skills Demonstrated

- AWS EC2
- Linux Administration
- SSH
- NGINX
- DNS Management
- Networking
- Git & GitHub

## Challenges Faced

### DNS Propagation

After creating the DNS A record, the custom domain did not resolve immediately. This was resolved by waiting for DNS propagation to complete.

### SSH Troubleshooting

Initially experienced SSH authentication issues due to an incorrect PEM file reference. This was resolved by using the correct SSH key.

### AWS Networking

Verified Security Group rules and confirmed that HTTP (80) was open to the public and SSH (22) was restricted appropriately.

## Screenshots

- EC2 instance running with successful status checks.
- Security Group configuration.
- DNS A record configuration in IONOS.
- NGINX welcome page served from `nginx.shukriigal.com`.

## Technologies Used

- AWS EC2
- Ubuntu
- NGINX
- IONOS DNS
- Git
- GitHub

## Outcome

Successfully deployed a public NGINX web server on AWS and configured a custom domain (`nginx.shukriigal.com`) to route traffic to the EC2 instance.

