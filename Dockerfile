# Stage 1: Build stage
FROM node:14 as build-stage
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Production stage
FROM nginx:alpine
COPY --from=build-stage /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

