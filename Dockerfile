FROM node:20-alpine3.17

WORKDIR /src

COPY tsconfig*.json ./
COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:20-alpine3.17

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "dist/main.js" ]