FROM node:alpine

WORKDIR /app

COPY package.json .

RUN yarn

COPY . .

EXPOSE 3005

CMD ["npm", "run", "start"]
