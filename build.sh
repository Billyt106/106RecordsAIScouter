#!/bin/bash

# Upgrade pip to the latest version
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies from requirements.txt
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Install Playwright
echo "Installing Playwright..."
playwright install

# Check if Playwright is installed in the specified directory
if [ -f "/opt/render/.cache/ms-playwright/webkit-1578/pw_run.sh" ]; then
    echo "Playwright is installed in the desired directory."
else
    echo "Playwright is not installed in the desired directory."
    # Additional commands to handle the situation can be added here
fi
