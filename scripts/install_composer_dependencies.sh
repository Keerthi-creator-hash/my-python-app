#!/bin/bash

# Exit on error
set -e

# Redirect output to log file for debugging
exec > >(tee -a /var/log/codedeploy_install.log) 2>&1

# Navigate to the application directory
cd /home/ubuntu/my-python-app

echo "Navigated to /home/ubuntu/my-python-app"

# Check if python3 is installed
if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found. Please install python3."
    exit 1
fi

# Check if pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip could not be found. Installing pip..."
    sudo apt-get update
    sudo apt-get install -y python3-pip
fi

# Check if the virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating a new virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists. Activating it..."
fi

# Activate the virtual environment
source venv/bin/activate

# Install the required packages
echo "Installing Flask..."
pip install flask==2.3.2

# Deactivate the virtual environment
deactivate

echo "Installation completed successfully."
