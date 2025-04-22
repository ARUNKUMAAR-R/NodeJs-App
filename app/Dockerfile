#-- Build Stage  --##
FROM node:14-alpine as Build

WORKDIR /usr/src/app

COPY . ./
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]


#-- Serve with Nginx  --##
FROM nginx:alpine as Production

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

