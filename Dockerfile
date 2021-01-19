FROM strapi/strapi

RUN mkdir /app
WORKDIR /app

COPY ./package.json ./

RUN yarn install

COPY . .

ENV NODE_ENV production

RUN yarn build

CMD ["yarn", "start"]
