FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y apt-utils nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout cert.key \
    -out cert.crt \
    -subj "/C=FR/ST=Europe/L=Paris/O=42/OU=IT/CN=example.com"

RUN mkdir -p /etc/nginx/ssl && \
    mv cert.key /etc/nginx/ssl/inception.key && \
    mv cert.crt /etc/nginx/ssl/inception.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
