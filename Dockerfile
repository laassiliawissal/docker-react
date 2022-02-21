FROM node:16-alpine as Builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#copy over the results of npm run build
COPY --from=Builder /app/build /usr/share/nginx/html 
