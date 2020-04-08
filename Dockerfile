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
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
