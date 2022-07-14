FROM node:alpine
WORKDIR /app
COPY index.js package.json package-lock.json ./
RUN npm install 
CMD [ "node", "index.js" ]
