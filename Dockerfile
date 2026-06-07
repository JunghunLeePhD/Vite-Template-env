FROM node:20-alpine

RUN apk update && apk add git openssh
WORKDIR /app

EXPOSE 5173
