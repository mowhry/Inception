# 🏗️ Inception – Dockerized Services

A compact and secure infrastructure built with **Docker** and **Docker Compose**, designed to host **NGINX**, **WordPress**, and **MariaDB** in separate containers—each  
following best practices for containerization and minimal overhead. This project was a deep dive into Docker fundamentals, service isolation, and TLS-encrypted deployments.

---

## 📖 Table of Contents

1. [About the Project 🚀](#-about-the-project)
2. [Features ✨](#-features)
3. [Prerequisites 📋](#-prerequisites)
4. [Installation & Setup 💻](#-installation--setup)
5. [Learning Outcomes 📚](#-learning-outcomes)
6. [License ⚖️](#-license)

---

## 🚀 About the Project

In this project, I built a **mini-infrastructure** using Docker Compose that separates **NGINX (with TLS)**, **WordPress + php-fpm**, and **MariaDB** into distinct containers.  
By doing so, I gained hands-on experience with container orchestration, environment configuration, and best practices for securing services within Docker.  
The server architecture relies on a single entry point over HTTPS (`port 443`) with **TLSv1.2 or TLSv1.3** enforced by NGINX. WordPress (backed by php-fpm) and MariaDB each reside in their own containers,  
ensuring modular design and maintainable deployments.

---

## ✨ Features

- **TLS-Only NGINX**  
  - Configured to allow **only** TLSv1.2 or TLSv1.3, enhancing security.  
  - Acts as the single gateway to all other services.

- **Modular Services**  
  - **WordPress + php-fpm** in a standalone container (no embedded NGINX).  
  - **MariaDB** in its own container, decoupled from WordPress.  

- **Data Persistence**  
  - Dedicated Docker **volume** for WordPress site files.  
  - Dedicated Docker **volume** for the MariaDB database.

- **Environment Variables & Secrets**  
  - Sensitive data (passwords, credentials) injected via environment variables.  
  - Potential use of `.env` or Docker Secrets for better security.

- **Docker Network**  
  - A custom **docker-network** ensures containers communicate internally without exposing extra ports.

- **Local Domain Setup**  
  - A local DNS entry (`login.42.fr`) mapped to `127.0.0.1` (or another local IP) for easier access.

- **Auto-Restart**  
  - Containers set to restart on crash to improve resilience.

---

## 📋 Prerequisites

- **Docker** & **Docker Compose** installed on the host machine.  
- **Alpine** or **Debian** (latest stable minus one version) as base images for each container.  
- A basic understanding of **Dockerfiles** and **Makefiles** (if you’re automating builds).

Make sure your system is up to date and Docker is correctly configured before proceeding.

---

## 💻 Installation & Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/mowhry/inception.git
   cd inception
2. **(Optional) Environment File:**  
- Create a .env file to store credentials (like DB_USER, DB_PASS, and WP_ADMIN_PASS).  
- For instance:
   ```bash
   DB_USER=myuser
   DB_PASS=mysecret
   WP_ADMIN_PASS=supersecret
   DOMAIN=login.42.fr
3. **Build and Launch Containers:**  
   ```bash
   docker-compose up --build -d
---

## 📚 Learning Outcomes
Throughout this project, I gained insights into:
- **Containerization Principles**: Isolating services in separate containers for cleaner, more secure deployments.
- **TLS Configuration**: Enforcing TLSv1.2 or TLSv1.3 within NGINX to secure traffic and restrict weaker protocols.
- **Infrastructure as Code**: Writing Dockerfiles, managing volumes, and linking containers with Docker Compose.
- **Credential Management**: Using environment variables (and potentially Docker Secrets) to prevent exposing passwords in code.
- **Best Practices**: Avoiding infinite loops (tail -f, sleep), using daemons responsibly, and ensuring containers restart on failure.

## ⚖️ License

This project is distributed under the MIT License. You are free to use, modify, and distribute it under the terms of the license.

**Disclaimer**: Replace every reference to login with your actual 42 login and set up your local DNS (e.g., /etc/hosts) so that login.42.fr resolves to your local machine’s IP.
