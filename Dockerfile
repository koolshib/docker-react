# Build stage
FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 

# Production stage 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx is going to startup the container for us so se don't need to specifically run anything for nginx
