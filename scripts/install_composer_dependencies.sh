#!/bin/bash
set -e
set -x

# Update package manager
sudo apt update

# Install Python3 and pip
sudo apt install -y python3 python3-venv python3-pip

# Install Composer
if ! command -v composer &> /dev/null; then
    echo "Installing Composer..."
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
fi

# Navigate to application directory
cd /home/ubuntu/my-python-app

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Deactivate the virtual environment
deactivate
