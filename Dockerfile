# build stage
FROM node:alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run stage
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
