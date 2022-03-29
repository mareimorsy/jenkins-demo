FROM node:17-alpine3.14
# USER root
WORKDIR /app
ADD app/ /app/
RUN npm cache clean -f && rm -rf node_modules && npm install
EXPOSE 3000
CMD ["node", "/app/app.js"]