# Use Node.js LTS version as base image
FROM node:20-alpine

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory inside the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml (if exists)
COPY package*.json pnpm-lock.yaml* ./

# Install dependencies with pnpm
RUN pnpm install

# Copy the rest of the application
COPY . .

# Expose the port Vite dev server runs on
EXPOSE 5173

# Start the development server
CMD ["pnpm", "run", "dev"]
