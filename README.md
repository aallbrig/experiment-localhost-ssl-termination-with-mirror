# SSL Termination Simulation on LocalHost using Self Signed Certificates and Mirror Networking

### Prereqs
```bash
# nginx
brew install nginx
brew services start nginx

less /opt/homebrew/etc/nginx/ssl_termination_site.nginx.conf
```

### Generate Self-Signed Certificates
```bash
# Generate a Self-Signed Certificate from the CSR valid for 365 days
mkdir -p /opt/homebrew/etc/nginx/ssl
cd /opt/homebrew/etc/nginx/ssl
openssl req -new -key server.key -out server.csr -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/OU=YourUnit/CN=localhost"
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# Create directory for WebGL Game Client
mkdir -p /opt/homebrew/etc/nginx/html

# Symlink the configuration from this repo into nginx's servers directory
ln -s \
  $(pwd)/opt/homebrew/etc/nginx/servers/ssl_termination_site.nginx.conf \
  /opt/homebrew/etc/nginx/servers/ssl_termination_site.nginx.conf

brew services restart nginx
nginx -t
```

### Open Web Game Client
```bash
open https://localhost:8443/game
```
