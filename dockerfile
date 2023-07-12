FROM node:16.15.0-bullseye-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/evanlueber/taschenrechner .
RUN git pull
RUN docker compose build
RUN npm ci
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]