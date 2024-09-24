# Dockerfile for Ubuntu Linux
# Author: [Jesús Ariel González Bonilla]
# Date: [24-09-2024]

FROM ubuntu:latest

# Install basic packages
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    net-tools \
    iputils-ping \
    openssh-server

# Set environment variables
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Set working directory
WORKDIR /root

# Create SSH directory and set permissions
RUN mkdir /var/run/sshd

# Allow root login via SSH by modifying the SSH config file
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create an entrypoint script to set root password
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SSH port (22)
EXPOSE 22

# Run the entrypoint script and start SSH
CMD ["/entrypoint.sh"]