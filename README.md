# Apache SSL Configuration Inside Docker

## Project Overview
Implemented an Apache Web Server inside a Docker container with SSL/TLS configuration using a self-signed SSL certificate.

The application is accessible through both HTTP and HTTPS.

## Technologies Used
- RHEL Linux
- Docker
- Apache HTTP Server
- OpenSSL
- SSL/TLS
- HTML

## Project Features
- Created a custom Apache Docker image.
- Generated a self-signed SSL certificate using OpenSSL.
- Enabled Apache SSL module.
- Configured HTTPS using a custom Apache SSL configuration.
- Exposed HTTP and HTTPS ports through Docker port mapping.
- Verified application access using curl and OpenSSL.

## Port Mapping

| Host Port | Container Port | Protocol |
|---|---|---|
| 8084 | 80 | HTTP |
| 8083 | 443 | HTTPS |

## SSL Certificate Generation

Generate the certificate and private key locally using OpenSSL:

```bash
mkdir -p ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout ssl/server.key \
-out ssl/server.crt \
-subj "/C=IN/ST=Rajasthan/L=Jaipur/O=DevOpsProject/CN=localhost"
```

The private key is excluded from GitHub.

## Build Docker Image

```bash
docker build -t apache-ssl:v1 .
```

## Run Container

```bash
docker run -d --name apache-ssl \
-p 8084:80 -p 8083:443 apache-ssl:v1
```

## Testing

HTTP:

```bash
curl http://localhost:8084
```

HTTPS:

```bash
curl -k https://localhost:8083
```

Check SSL connection:

```bash
openssl s_client -connect localhost:8083 -servername localhost
```

Note: The project uses a self-signed certificate for learning and testing. Browsers will show a certificate trust warning unless the certificate is explicitly trusted.

## Learning Outcomes
- Docker image creation and container management.
- Apache web server configuration.
- SSL certificate and private key generation.
- HTTPS configuration inside Docker.
- HTTP and HTTPS connectivity verification.

## Project Result
Successfully configured and tested an Apache web server inside Docker with SSL/TLS support.


