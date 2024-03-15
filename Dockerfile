FROM node:16 as build-step

WORKDIR /app

COPY package.json /app/

RUN npm install


COPY . /app

RUN npm run build


