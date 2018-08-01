FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install curl command inside docker CONTAINER for healthcheck
# RUN apt-get update && apt-get install -y --no-install-recommends curl && apt-get clean

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]

# Healthcheck of the deployed application 
# What intervals, retries, timeout : After the first check wait for this timeout to try again, start-period: The time to 
# spin the application. Use Curl command to check the docker internal docker port and use localhost
# 
# HEALTHCHECK --interval=15s --retries=5 --timeout=30s --start-period=30s CMD curl -I -f "http://localhost:3000" || exit 1
