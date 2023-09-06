# Use an official Ubuntu Linux as the base image
FROM ubuntu:latest

# Install Node.js and npm
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node

# Print the installed Node.js and npm versions
RUN node -v && npm -v

# Set a command to keep the container running (optional)
CMD ["tail", "-f", "/dev/null"]
