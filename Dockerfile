# Use the official lightweight Node.js 16 image.
# https://hub.docker.com/_/node
FROM node:16-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to work directory
COPY package*.json ./

# Install dependencies
# If you're using a yarn.lock file, uncomment the following line and delete the npm install line.
# RUN yarn install --frozen-lockfile
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Playwright specific steps: 
# 1. Skip browser download as we'll use installed browsers in the Docker image
# 2. Install Playwright browsers
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
RUN npx playwright install-deps
RUN npx playwright install

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 3000

# Run the web service on container startup.
CMD [ "node", "src/index.js" ]
