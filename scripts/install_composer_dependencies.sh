#!/bin/bash
# Navigate to the application directory
cd /home/ubuntu/my-python-app

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install the required packages
pip install flask==2.3.2

# Deactivate the virtual environment
deactivate
