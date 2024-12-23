#!/bin/bash
# Stop any running Flask applications
pkill -f "python3 app.py" || true
