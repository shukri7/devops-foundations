# 🌐 AWS EC2 + NGINX Web Server

## Project Overview

Deployed an NGINX web server on an Ubuntu EC2 instance and configured a custom domain using IONOS DNS.

The goal was to gain hands-on experience with AWS infrastructure, Linux server administration, security groups, and DNS configuration.

## Technologies Used

- AWS EC2
- Ubuntu Linux
- NGINX
- SSH
- AWS Security Groups
- IONOS DNS
- Git and GitHub

## What I Did

1. Launched an Ubuntu EC2 instance on AWS.
2. Connected to the server using SSH and a PEM key.
3. Configured security group rules for SSH (port 22) and HTTP (port 80).
4. Installed and started NGINX using Linux commands.
5. Registered the domain `shukriigal.com` through IONOS.
6. Created a DNS A record pointing `nginx.shukriigal.com` to the instance's public IP address.
7. Tested the web server and verified that the NGINX welcome page was accessible.

## Architecture

```text
Internet
   |
   v
nginx.shukriigal.com
   |
   v
IONOS DNS (A Record)
   |
   v
EC2 Public IP
   |
   v
Ubuntu EC2 Instance
   |
   v
NGINX Web Server
```

## What Changed

**Before:** No deployed web server or configured domain routing.

**After:** An Ubuntu EC2 instance running NGINX, with a custom subdomain configured to point to the server.

## Challenges and Troubleshooting

**SSH authentication:** Initially referenced the wrong PEM file. Corrected the SSH key path to establish a connection.

**DNS propagation:** The domain did not resolve immediately after creating the A record. Allowed time for DNS propagation and verified the configuration.

**AWS networking:** Checked security group rules to confirm HTTP access and appropriate SSH restrictions.

## Results and Verification

- Successfully launched and connected to an Ubuntu EC2 instance.
- Installed and verified NGINX.
- Configured a custom DNS record.
- Confirmed that the NGINX welcome page loaded during testing.

**Project URL at the time of deployment:** `http://nginx.shukriigal.com`

### Screenshot

![NGINX welcome page](screenshots/Screenshot%202026-07-21%20203601.png)

## Key Takeaways

This project strengthened my understanding of how Linux, AWS networking, security groups, and DNS work together to make a web server publicly accessible. It also gave me practical experience troubleshooting SSH and DNS issues.

