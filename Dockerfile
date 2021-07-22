FROM node:14.17.3

WORKDIR /app

RUN npm install -g @angular/cli

RUN npm install --global http-server

EXPOSE 4200
COPY ./shellscript.sh ./shellscript.sh

CMD ./shellscript.sh
