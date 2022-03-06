FROM node:16

WORKDIR /app

RUN rm -fR *

COPY package.json .
COPY .env .

RUN npm install
COPY . .

EXPOSE 3005

CMD ["npm", "run", "start"]