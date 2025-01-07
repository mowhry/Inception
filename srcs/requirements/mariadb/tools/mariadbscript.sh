#!/bin/bash
set -e

echo "[INFO] Running SQL statements (initialization)..."

service mariadb start;
sleep 5

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
  CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;  # Utilisation de MYSQL_DATABASE
  CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';  # Utilisation de MYSQL_USER et MYSQL_PASSWORD
  GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';  # Utilisation de MYSQL_DATABASE
  FLUSH PRIVILEGES;
"

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

echo "[INFO] Starting mysqld in foreground..."
exec mysqld_safe
