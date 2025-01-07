FROM debian:bullseye

RUN apt-get update &&  \
    apt-get install -y mariadb-server mariadb-client apt-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/mysqd
RUN chown -R mysql:mysql /var/mysqd
RUN chmod 755 /var/mysqd

COPY ./tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh
RUN chmod +x /usr/local/bin/mariadbscript.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


EXPOSE 3306

CMD ["/usr/local/bin/mariadbscript.sh"]
