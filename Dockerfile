# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to non-interactive
# This is useful to avoid some prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Run package update and install Apache
RUN apt-get update && apt-get install -y apache2

# Apache runs on port 80 by default, expose this port
EXPOSE 80

# Copy your website's files into the default Apache directory
# Uncomment and adjust the line below if you have website files to add
COPY index.html /var/www/html

# Start Apache in the foreground
CMD ["apache2ctl", "-DFOREGROUND"]
