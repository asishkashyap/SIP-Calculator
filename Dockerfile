# Stage 1: Build
FROM node:14 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Build your app here if needed, for example:
# RUN npm run build

# Stage 2: Runtime
FROM node:14-slim

WORKDIR /app

COPY --from=build /app /app

COPY package*.json ./

# Reinstall only production dependencies
RUN npm install --only=production

CMD [ "npm", "start" ]
