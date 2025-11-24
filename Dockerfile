# Step 1: Use a tiny Node.js base image
FROM node:20-alpine

# Step 2: Set directory inside container
WORKDIR /app

# Step 3: Copy dependency files first (for better caching)
COPY package*.json ./

# Step 4: Install only production dependencies (skip devTools in container)
RUN npm ci --omit=dev

# Step 5: Copy the rest of your source code
COPY . .

# Step 6: Tell Docker what port your app listens on
EXPOSE 3000

# Step 7: Start the app
CMD ["node", "app.js"]

