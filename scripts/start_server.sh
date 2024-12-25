#!/bin/bash
# Navigate to the application directory and start the Flask application
cd /www/html/mypython
nohup python3 app.py > app.log 2>&1 &
