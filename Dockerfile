FROM node:alpine
LABEL maintainer="Ivo von Putzer <ivo.putzer@it.clara.net>"

ENV NPM_CONFIG_LOGLEVEL error
ENV NPM_CONFIG_PRODUCTION true
ENV HTTP_PORT 80

WORKDIR /usr/src
COPY package.json ./

RUN npm install --no-optional --no-progress\
 && npm cache clean --force --silent

COPY ./ ./

EXPOSE 80

ENTRYPOINT [ "npm" ]
CMD [ "start" ]

