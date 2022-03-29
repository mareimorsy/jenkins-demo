FROM node:17-alpine3.14

WORKDIR /app
COPY app/ /app/
RUN npm install
EXPOSE 3000
CMD ["node", "/app/app.js"]