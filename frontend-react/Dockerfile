FROM node:22-alpine As Build
WORKDIR /build
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#image for production
FROM nginx:stable-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=Build /build/dist /usr/share/nginx/html
EXPOSE 80
