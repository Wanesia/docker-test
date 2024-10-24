# Step 1: Build Stage
FROM node:20.18.0 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . . 

# Step 2: Production Stage
FROM node:20.18.0-slim
WORKDIR /app
RUN useradd -m appuser
COPY --from=build /app .
RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 3000
CMD ["node", "src/server.js"]