# Base image
FROM node:18-slim As development

# Install open ssl
RUN apt-get update
RUN apt-get install -y openssl

# Create app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND package-lock.json (when available).
# Copying this first prevents re-running npm install on every code change.
COPY package*.json ./
COPY /prisma ./prisma/

# Install app dependencies
RUN npm ci

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

# Base image for production
FROM node:18-alpine As production

# Set NODE_ENV environment variable
ENV NODE_ENV production

# Copy the bundled code
COPY --from=development /usr/src/app/node_modules ./node_modules
COPY --from=development /usr/src/app/package*.json ./
COPY --from=development /usr/src/app/dist ./dist

# Clean dev packages
RUN npm prune --production

# Start the server using the production build
CMD [ "node", "dist/main.js" ]
