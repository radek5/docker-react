#Build Phase - Specify a base image
FROM node:alpine as builder
WORKDIR '/app'

# Download and install dependencies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
