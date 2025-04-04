# build stage
FROM node:20-alpine as build-stage

WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# production stage
FROM nginx:stable-alpine as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["sh", "/entrypoint.sh"]
