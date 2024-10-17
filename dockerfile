# Step 1: Build Stage
FROM node:20 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . . 

# Step 2: Production Stage
FROM node:20-slim
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "src/server.js"]