🌌 Inception: Setting Up A Multi-container Infrastructure
Welcome to the Inception project, where we create a small infrastructure with various services using Docker Compose.

🌟 Main Features:
Custom Docker Images: You must create your own Docker images using Dockerfiles.
Consistent Naming: Docker image names should correspond to their service names.
Separation of Concern: Each service runs in its dedicated container.
Security: Use either TLSv1.2 or TLSv1.3 with NGINX.
No Cheating: No pulling of ready-made Docker images or using services like DockerHub (excluding Alpine/Debian).
Persistence: Use volumes to persist the WordPress database and website files.
Networking: Setup a docker-network for inter-container communication.
Resilience: Containers should restart on crash.
No Loops or Hacks: Containers should not use infinite loops or hacks to run.
Unique Admin Username: The administrator username for WordPress should not contain common terms like admin or administrator.
🛠 Setup:
NGINX: Encrypted with TLSv1.2 or TLSv1.3.
WordPress + php-fpm: Without nginx.
MariaDB: Without nginx.
Volume 1: WordPress database.
Volume 2: WordPress website files.
docker-network: Facilitates communication between containers.
📁 File Structure:
Dockerfiles/: Contains Dockerfiles for each service.
srcs/: Contains source files and a .env file storing environment variables.
🚫 Restrictions:
Containers should not use the network: host, --link, or links: commands.
The latest tag is prohibited.
No passwords in Dockerfiles. Use environment variables instead.
🌐 Domain Configuration:
Configure your domain name to point to your local IP.
Use login.42.fr as your domain. Replace login with your personal login. For example, if your login is "john", then your domain should be john.42.fr.
🏗 Infrastructure Diagram:
(You can include a diagram here if you have one or provide a link to the diagram)

🚀 Getting Started:
Clone this repository: git clone [repo-link].
Navigate to the repo: cd inception.
Build the Docker images: make build.
Start the infrastructure: docker-compose up -d.
