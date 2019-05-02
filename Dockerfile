FROM node:8.16.0-alpine
MAINTAINER Eric

COPY . /app
WORKDIR /app

RUN apk upgrade --update \
  && apk add --no-cache build-base \
  && apk add bash \
  && apk add make \
  && npm i -g redoc-cli \
  && cp specs/swagger.yaml /app/

EXPOSE 80

CMD redoc-cli bundle /app/swagger.yaml \
  && redoc-cli serve -p 80 /app/swagger.yaml