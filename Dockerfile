FROM node:20 as build-step

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

# ========================================
# NGINX STAGE
# ========================================

FROM nginx:1.23-alpine 

WORKDIR /usr/share/nginx/html/

COPY --from=build-step /app/build ./

CMD [ "nginx", "-g", "daemon off;" ]
