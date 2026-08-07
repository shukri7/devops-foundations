# 🚀 Flask + Redis Multi-Container Application

This project is part of my **DevOps Foundations** repository and demonstrates how to build, deploy, and scale a multi-container web application using **Docker**, **Docker Compose**, **Redis**, and **Nginx**.

The application consists of multiple Docker containers communicating over a Docker bridge network. Nginx acts as a reverse proxy, Flask serves the web application, and Redis stores the visitor count using persistent storage.

---

# 🏗️ Architecture

```text
                    Browser
                        │
                 localhost:8080
                        │
                        ▼
              Nginx Reverse Proxy
                        │
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
    Flask #1        Flask #2        Flask #3
        │               │               │
        └───────────────┼───────────────┘
                        ▼
                     Redis
                        │
                        ▼
               Persistent Docker Volume
```

---

# ✨ Features

- 🐳 Dockerized Flask application
- 🔴 Redis visitor counter
- 📦 Multi-container architecture with Docker Compose
- 🌐 Docker bridge networking
- ⚙️ Environment variables for application configuration
- 💾 Persistent Redis storage using Docker volumes
- 🔄 Nginx reverse proxy
- 📈 Horizontal scaling with multiple Flask containers

---

# 🛠️ Tech Stack

- Python
- Flask
- Redis
- Docker
- Docker Compose
- Nginx

---

# 📂 Project Structure

```text
devops-foundations/
└── docker/
    └── flask-redis-visitor-counter/
        ├── screenshots/
        │   ├── home-page.png
        │   ├── visit-count.png
        │   ├── docker-compose-ps.png
        │   └── docker-compose-up.png
        ├── static/
        │   ├── images/
        │   └── style.css
        ├── templates/
        │   └── index.html
        ├── app.py
        ├── Dockerfile
        ├── docker-compose.yml
        ├── nginx.conf
        ├── requirements.txt
        ├── .dockerignore
        └── README.md
```

---

# 🚀 Getting Started

Clone the repository:

```bash
git clone https://github.com/shukri7/devops-foundations.git
cd devops-foundations/docker/flask-redis-visitor-counter
```

Build and start the application:

```bash
docker compose up --build --scale web=3
```

Open the application:

**Home Page**

```
http://localhost:8080
```

**Visitor Counter**

```
http://localhost:8080/count
```

---

# 📸 Screenshots

## Home Page

![Home Page](screenshots/home-page.png)

---

## Visitor Counter

![Visitor Counter](screenshots/visit-count.png)

---

## Docker Compose Services

![Docker Compose Services](screenshots/docker-compose-ps.png)

---

## Running Containers

![Running Containers](screenshots/docker-compose-up.png)

---

# 🧠 DevOps Concepts Demonstrated

This project demonstrates several core DevOps concepts:

- Docker image creation using Dockerfiles
- Multi-container orchestration with Docker Compose
- Docker bridge networking
- Docker DNS service discovery
- Environment variable configuration
- Persistent storage using Docker volumes
- Reverse proxy configuration with Nginx
- Horizontal scaling of application containers
- Service-to-service communication
- Containerized application deployment

---

# 🐞 Challenges & Solutions

### Flask could not connect to Redis

Initially, the Flask application could not communicate with Redis because the correct Docker service hostname was not being used.

**Solution**

Configured Flask to connect using the Docker Compose service name (`redis`), allowing Docker's internal DNS to resolve the container automatically.

---

### CSS not loading

The stylesheet was initially placed in the wrong directory, causing Flask to return a **404 Not Found** error.

**Solution**

Moved the stylesheet into Flask's `static` directory so it could be served correctly.

---

### Scaling the application

Running multiple Flask containers required introducing a reverse proxy so incoming requests could be routed through a single public endpoint.

**Solution**

Configured Nginx as a reverse proxy and scaled the Flask service while keeping Redis as a shared backend.

---

# 📚 What I Learned

Building this project strengthened my understanding of:

- Building custom Docker images
- Running multi-container applications with Docker Compose
- Container-to-container communication using Docker bridge networking
- Docker DNS service discovery
- Environment-based application configuration
- Persistent storage with Docker volumes
- Reverse proxies with Nginx
- Scaling containerized applications
- Production-inspired application architecture

This project also helped me better understand how containerized services communicate over Docker networks and how a reverse proxy can expose multiple application containers through a single public endpoint.

---

# 🔮 Future Improvements

- Add Docker health checks
- Implement CI/CD using GitHub Actions
- Automatically push Docker images to Amazon ECR
- Deploy the application to AWS ECS or Kubernetes
- Configure HTTPS with Let's Encrypt
- Add monitoring with Prometheus and Grafana
- Add automated testing

---

# 📄 License

This project was created for educational purposes as part of the CoderCo DevOps Bootcamp.