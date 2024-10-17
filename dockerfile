# Step 1: Start with the official Node.js image
FROM node:20

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json and install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of your app code into the container
COPY src ./src

# Step 5: Expose the port your app will run on
EXPOSE 3000

