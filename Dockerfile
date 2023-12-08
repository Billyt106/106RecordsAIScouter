# Use an official Node runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) into the container
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# If you're building your code for production
# RUN npm ci --only=production

# Install Playwright and its dependencies
RUN npx playwright install

# Bundle your app's source code inside the Docker container
COPY . .

# Make port available to the world outside this container
EXPOSE 3000

# Define environment variable
ENV PLAYWRIGHT_BROWSERS_PATH /ms-playwright

# Run your app when the container launches
CMD ["node", "your-app-main-file.js"]
