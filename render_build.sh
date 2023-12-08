#!/bin/bash

# Upgrade pip to the latest version
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies from requirements.txt
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Install Playwright and its browsers
echo "Installing Playwright and its browsers..."
playwright install

# Any other build steps you need can be added here
