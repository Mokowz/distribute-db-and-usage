# Complete Database Replication Project

<h2 id="project-overview">Project Overview</h2>

This project demonstrates the distribution of a database using complete replication. It ensures high availability, fault tolerance, and scalability by maintaining synchronized copies of the database across multiple servers. The goal is to replicate data from a master database (source) to one or more replica databases, keeping them in real-time sync.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Technologies Used](#tech)
3. [Setup Instructions](#setup)
4. [Usage](#usage) 
5. [Contributing](#contributing)

<h2 id="tech">Technologies Used</h2>

- **MySQL**: For the database management system and handling replication.
- **AWS EC2 Instances**: Hosts for the source and replica databases.
- **SQL**: Used to write queries for managing database schemas and replication configuration.

<h2 id="setup">Setup Instructions</h2>

### System Requirements
- EC2 Instances: At least two EC2 instances with MySQL installed, one for the source and one for the replica.
- Network Configuration: Both instances should be in the same VPC and be able to communicate via their private IP addresses.
- MySQL User: A MySQL user with replication privileges should be set up on the source server.

### Configuration
SSH into your two servers and configure both the master and slave server using instructions in the everything.sh bash script.

Follow the steps on the bash script to configure your servers.

**Do not run the bash script as a whole**

```bash
# Open the bash script
vi everything.sh

# Follow the steps on it to configure your servers
```

<h2 id="usage">Usage</h2>
Run the following commands on both servers to ensure that both of them have the replicated tables and database as expected.

**Do not perform write operations on the replica server.
Do that on the master server, slave is only for read operations**

```bash
ssh -i $identity_file_path ubuntu@$ec2_ip_address

# Log in to the mysql server
sudo mysql

# List databases available
SHOW DATABASES;

# Use the StudentRecords db
USE StudentRecords;

# List the tables in it
SHOW TABLES;

# View data in any table eg Course
SELECT * FROM Course;
```

<h2 id="contributing">Contributing</h2>
Feel free to fork the repository, make improvements, or report issues. Submit a pull request with your changes or enhancements.


