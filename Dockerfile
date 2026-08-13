FROM node:18-alpine

WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm install

COPY app/ .

# Do NOT bake secrets into images. Provide secrets at runtime instead.
# See CLOUD_RUN.md for mapping to Cloud Run and docs for local run instructions.

CMD [ "npm", "start" ]
