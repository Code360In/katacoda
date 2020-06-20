cat > ~/nginx.conf <<EOF
user nginx;
worker_processes 1;
pid /var/run/nginx.pid;
daemon off;

events {
  worker_connections 512;
  # multi_accept on;
}

http {
  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;
  keepalive_timeout 65;
  types_hash_max_size 2048;

  include /etc/nginx/mime.types;
  default_type application/octet-stream;

  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for" "$http_host"';

  access_log stdout main;
  error_log  stdout debug;

  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}
EOF

cat > ~/nginx.default <<EOF
server {
  listen 80 default_server;
  listen [::]:80 default_server ipv6only=on;

  root /var/www/;
  index index.html index.htm;

  server_name _;

  location / {
    try_files $uri $uri/ =404;
  }
}
EOF