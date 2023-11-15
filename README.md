# SSL Termination Simulation on LocalHost using Self Signed Certificates and Mirror Networking

### Prereqs
```bash
# nginx
brew install nginx
brew services start nginx

less /opt/homebrew/etc/nginx/nginx.conf
```

### Generate Self-Signed Certificates
```bash
mkdir -p /opt/homebrew/etc/nginx/ssl
cd /opt/homebrew/etc/nginx/ssl

 openssl req -new -key server.key -out server.csr -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/OU=YourUnit/CN=localhost"

# Generate a Self-Signed Certificate from the CSR valid for 365 days
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
```

### Open Web Game Client
```bash
open https://localhost:8443/game
```
