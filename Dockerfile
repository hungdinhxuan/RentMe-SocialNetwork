FROM node:16-alpine
RUN apk add dumb-init
WORKDIR /app
COPY --chown=node:node package.json yarn.lock ./
RUN yarn install --production=true --network-timeout 1000000
COPY --chown=node:node . .
EXPOSE 5000
USER node
CMD ["dumb-init", "node", "server.js" ]
