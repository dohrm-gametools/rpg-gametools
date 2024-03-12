FROM node as builder
WORKDIR /usr/src/app
COPY package*.json /usr/src/app
COPY dist/* /usr/src/app
RUN npm ci --omit=dev

FROM node:alpine
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/* /usr/src/app

EXPOSE 3000

CMD ["node", "server.js"]
