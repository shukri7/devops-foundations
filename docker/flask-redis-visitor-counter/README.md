

#  Flask + Redis Visitor Counter

A multi-container Flask application built with Docker Compose, Redis, and Nginx.

I built this project to get hands-on with Docker networking, persistent storage, reverse proxies, and scaling an application across multiple containers.

---

# Architecture

```text
                    Browser
                       │
                localhost:8080
                       │
                       ▼
              Nginx Reverse Proxy
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
    Flask #1       Flask #2       Flask #3
        │              │              │
        └──────────────┼──────────────┘
                       ▼
                     Redis
                       │
                       ▼
              Persistent Volume
```

Nginx is the entry point to the application. It forwards traffic to the Flask service, which is running across three containers. All three Flask containers connect to the same Redis service for the visitor count.

---

# ✨ Features

- Flask + Redis application
- Multi-container setup with Docker Compose
- Nginx reverse proxy
- Docker bridge networking
- Docker DNS service discovery
- Redis volume for persistent data
- Environment variables for configuration
- 3 Flask containers running behind Nginx
- Separate home and visitor count pages

---

#  Tech Stack

- Python
- Flask
- Redis
- Docker
- Docker Compose
- Nginx

---

# 📂 Project Structure

```text
flask-redis-visitor-counter/
├── screenshots/
│   ├── home-page.png
│   └── visit-count.png
├── static/
│   └── style.css
├── templates/
│   ├── index.html
│   └── count.html
├── app.py
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── requirements.txt
├── .dockerignore
└── README.md
```

---

#  Running the Project

Clone the repository:

```bash
git clone https://github.com/shukri7/devops-foundations.git
cd devops-foundations/docker/flask-redis-visitor-counter
```

Build and start the containers:

```bash
docker compose up --build --scale web=3
```

Check the running services:

```bash
docker compose ps
```

You should see Nginx, Redis, and three Flask containers running.

---

# 🌐 Accessing the App

### Home

```text
http://localhost:8080
```

The home page gives an overview of the application and the services running behind it.

### Visitor Count

```text
http://localhost:8080/count
```

The count is stored in Redis and increases whenever the count page is visited or refreshed.

---
# 🎬 Demo

A quick walkthrough of the application showing the home page, visitor counter, and Redis-backed count updating on refresh.


https://github.com/user-attachments/assets/90546af3-efcb-4a1d-a974-6e7522f26f7a



The demo shows the application running through Nginx, navigating from the home page to the visitor counter, and the Redis-backed count updating when the page is refreshed.
---

#  What This Project Covers

### Docker Compose

Docker Compose manages the Flask, Redis, and Nginx services together instead of running each container manually.

### Container Networking

The services communicate over Docker's bridge network. Flask connects to Redis using the `redis` service name instead of a container IP address.

### Nginx

Nginx sits in front of the Flask application as the reverse proxy. The browser connects through port `8080`, while the Flask containers stay internal on port `5000`.

### Scaling

The Flask service can be scaled to multiple containers:

```bash
docker compose up --build --scale web=3
```

Nginx provides one entry point for the application while requests are handled by the Flask containers behind it.

### Redis

Redis stores the visitor count so the data is shared between all Flask containers instead of being tied to one container.

### Persistent Storage

Redis uses a Docker volume so the count can survive container restarts.

### Environment Variables

The Flask application gets the Redis host and port from environment variables rather than hardcoding the connection details.

---

#  Problems I Ran Into

### Flask couldn't connect to Redis

At first, I had to understand that `localhost` inside the Flask container refers to the Flask container itself, not Redis.

I connected Flask using the Redis Compose service name instead:

```text
redis
```

Docker's internal DNS handles resolving that name to the Redis container.

### CSS wasn't loading

Flask wasn't finding the stylesheet because it wasn't in the correct location. Moving it into the `static` directory fixed it.

### Scaling Flask

Once I scaled Flask to multiple containers, I needed a single entry point for the application. I added Nginx in front of the Flask service and exposed Nginx on port `8080`.

---

#  What I Learned

This project helped me get more comfortable with:

- Building Docker images
- Running multi-container applications
- Docker Compose
- Container networking
- Docker DNS
- Service-to-service communication
- Redis
- Persistent volumes
- Environment variables
- Nginx reverse proxying
- Scaling application containers
- Troubleshooting containerized applications

---

#  Next Steps

Some things I'd like to add later:

- Docker health checks
- Automated testing
- GitHub Actions CI/CD
- AWS deployment
- Monitoring and logging
