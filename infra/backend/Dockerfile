FROM node:alpine

WORKDIR /app

COPY ./package*.json .
COPY ./yarn.lock .

RUN npm install

#COPY ../../backend .

# Expondo porta 3005
EXPOSE 3005

CMD ["npm", "run", "start"]


