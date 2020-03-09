FROM node:12-alpine as node
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=node /app/dist /usr/share/nginx/html