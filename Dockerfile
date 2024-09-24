FROM node:22-alpine

WORKDIR /app

ADD package-lock.json /app/package-lock.json
ADD package.json /app/package.json

RUN npm install

ADD . /app/

EXPOSE 5173
ENV HOST=0.0.0.0

ENTRYPOINT [ "npm", "run", "dev" ]