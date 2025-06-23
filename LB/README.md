# Load Balancer Setup

This project demonstrates a simple load-balanced web application stack using **HAProxy** as the load balancer, **Nginx** as the web server, and **PHP** for backend processing.

## Architecture

```
Client
    |
    v
[HAProxy]  <--- Load Balancer
    |
    v
[Nginx + PHP]  <--- Web Servers (1..N)
```

## Components

- **HAProxy**: Distributes incoming HTTP requests to multiple Nginx servers.
- **Nginx**: Serves static files and forwards PHP requests to PHP-FPM.
- **PHP**: Handles dynamic content.

## Getting Started

1. **Clone the repository**
     ```bash
     git clone <repo-url>
     cd skycloud-down/docker/LB
     ```

2. **Build and Start Services**
     ```bash
     docker-compose up --build
     ```

3. **Access the Application**
     - Open your browser and go to: `http://localhost:8080`

## File Structure

- `haproxy/` - HAProxy configuration and Dockerfile
- `nginx/` - Nginx configuration and Dockerfile
- `php/` - PHP application code and Dockerfile
- `docker-compose.yml` - Orchestrates all services

## Useful Commands

- **Stop all services**
    ```bash
    docker-compose down
    ```

- **View logs**
    ```bash
    docker-compose logs -f
    ```

## References

- [HAProxy Documentation](https://www.haproxy.org/)
- [Nginx Documentation](https://nginx.org/)
- [PHP Documentation](https://www.php.net/)

---

*Feel free to customize this stack for your needs!*