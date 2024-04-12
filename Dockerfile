# Use nvidia/cuda:12.4.1-base-ubuntu22.04 as the base image
FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04

# Install SSH service
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Change the root user password
RUN echo 'root:passwd' | chpasswd

# Add user user with password and grant root privileges
# RUN useradd -m -s /bin/bash user && echo 'user:passwd' | chpasswd && usermod -aG sudo user

# Allow root user to log in remotely
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Configure SSH service to start automatically
CMD ["/usr/sbin/sshd", "-D"]
