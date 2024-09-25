# Dockerfile for Mongo with locale configuration
# Author: [Jesús Ariel González Bonilla]
# Date: [21-06-2024]

# Dockerfile for MongoDB with both mongo and mongosh clients
FROM mongo:latest

# Install wget, gnupg and curl
RUN apt-get update && apt-get install -y wget gnupg curl

# Add MongoDB's official GPG key
RUN curl -fsSL https://pgp.mongodb.com/server-6.0.asc | tee /etc/apt/trusted.gpg.d/mongodb.asc

# Add MongoDB's repository for mongosh
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Install mongosh (MongoDB shell)
RUN apt-get update && apt-get install -y mongodb-mongosh

# Clean up unnecessary files to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose MongoDB port
EXPOSE 27017

# Comando de inicio para MongoDB
CMD ["mongod", "--bind_ip_all"]