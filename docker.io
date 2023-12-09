# Use the official Python image with a tag specifying the Python version
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . .

# Install Playwright and browser dependencies
RUN pip install playwright
RUN playwright install
RUN sudo playwright install-deps

# Command to run the application
CMD ["python", "__innit__.py"]
