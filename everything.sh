#!/usr/bin/env bash
#
# Install mysql
sudo apt update
sudo apt install mysql-server -y

# Start the mysql server on both servers
sudo systemctl start mysql
sudo systemctl enable mysql

# Configure the source (master) server
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf # Change the bind address, server-id, log-bin only

# Restart MySQL
sudo systemctl restart mysql

# Create replica user (while on the master server still)
sudo mysql
CREATE USER 'replica_user'@'replica_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'replica_server_ip';
FLUSH PRIVILEGES;

# Retrieve the binary logs (while on master server)
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;

# Create a simple db
UNLOCK TABLES;
CREATE DATABASE db;
exit

# Configure the Replica User
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf # Change the server-id, log-bin only

sudo systemctl restart mysql

# Test the Replication (on replica)
sudo mysql
CHANGE REPLICATION SOURCE TO
SOURCE_HOST='source_server_ip',
SOURCE_USER='replica_user',
SOURCE_PASSWORD='password',
SOURCE_LOG_FILE='mysql-bin.000001',
SOURCE_LOG_POS=899;

START REPLICA;

SHOW REPLICA STATUS\G;


# Add tables in the master server and wait for replication to happen

