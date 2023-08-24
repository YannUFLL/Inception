## 🌌 Inception: My Dockerized Infrastructure

Welcome to the "Inception" project at 42 School. I've crafted a robust, multi-functional infrastructure using Docker Compose.

### 🌟 Project Features:

1. **Custom Docker Images**: Docker images tailored specifically for this project.
2. **Consistent Naming**: Docker image names mirror the services they represent.
3. **Service Segregation**: Each service operates in its own dedicated container.
4. **Advanced Security**: NGINX is set up with the TLSv1.2 or TLSv1.3 protocol.
5. **Data Persistence**: Volumes are used to hold the WordPress database and website files.
6. **Docker Networking**: A dedicated network setup allows inter-container communication.
7. **Resilience**: Containers are designed to restart upon failure.
8. **WordPress Administration**: Admin users are defined with unique usernames, avoiding generic names such as "admin".

### 🛠 Components:

- **NGINX**: A web server secured with TLSv1.2 or TLSv1.3.
- **WordPress + php-fpm**: Operates independently, without NGINX.
- **MariaDB**: Database setup devoid of NGINX interference.
- **Volume 1**: Houses the WordPress database.
- **Volume 2**: Holds the WordPress website files.

### 📁 File Structure:

- `Dockerfiles/`: Contains the Dockerfiles for each service.
- `srcs/`: Houses project source files and a `.env` file for environment variables.

### 🌐 Domain Configuration:

1. My domain name points to my local IP address.
2. The domain is structured as `ydumaine.42.fr`.

### 🚀 Getting Started:

1. Clone this repository: `git clone [repo-link]`.
2. Navigate to the directory: `cd inception`.
3. Build and Launch the infrastructure : `make`.

---

🌌 Dive into a universe of containerized infrastructure with Inception, a comprehensive project I undertook at 42 School! 🌌
