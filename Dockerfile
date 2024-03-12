FROM node as backend
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN npm ci && npm run build

FROM node as frontend
WORKDIR /usr/src/app
RUN echo "WIP"

FROM node as assembly
WORKDIR /usr/src/app
COPY package*.json /usr/src/app
RUN npm ci --omit=dev

FROM node:alpine
WORKDIR /usr/src/app

COPY --from=assembly /usr/src/app /usr/src/app/
COPY --from=backend /usr/src/app/dist /usr/src/app/
# COPY --from=frontend /usr/src/app/dist /usr/src/app/frontend/

EXPOSE 3000

CMD ["node", "server.js"]
