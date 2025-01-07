#!/bin/bash


create_wp_config() {
    echo "Création du fichier wp-config.php..."
    sleep 10;
    wp config create --allow-root \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$WP_HOST" \
        --path="$WP_DIRECTORY"
}

install_wp_core() {
    echo "Installation de WordPress..."
    wp core install --allow-root \
        --url="$WP_SITE_URL" \
        --title="$WP_SITE_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="$WP_DIRECTORY"
}

create_wp_user() {
    echo "Création de l'utilisateur WordPress..."
    wp user create --allow-root \
        "$WP_USER" \
        "$WP_EMAIL" \
        --role="author" \
        --user_pass="$WP_PASSWORD" \
        --path="$WP_DIRECTORY"
}

install_wordpress() {
    create_wp_config

    install_wp_core

    create_wp_user
}

if [ ! -f "$WP_DIRECTORY/wp-config.php" ]; then
    echo "wp-config.php non trouvé. Lancement de l'installation de WordPress..."

    cd "$WP_DIRECTORY"

    install_wordpress

fi

exec /usr/sbin/php-fpm7.4 -F -R
