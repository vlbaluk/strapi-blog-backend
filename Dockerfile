FROM strapi/strapi
ENV DATABASE_CLIENT=postgres
ENV DATABASE_HOST=postgres
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=strapi_blog
ENV DATABASE_USERNAME=admin
ENV DATABASE_PASSWORD=admin
ENV PORT=1337
RUN mkdir /app
WORKDIR /app

COPY ./package.json ./

RUN yarn install

COPY . .

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337
EXPOSE 50072
EXPOSE $PORT

CMD ["yarn", "start"]
