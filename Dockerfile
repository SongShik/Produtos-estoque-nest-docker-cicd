FROM node:18-alpine

WORKDIR /usr/app

COPY package.json ./

RUN npm install

COPY . .

ARG MONGO_URI
ARG JWT_SECRET

ENV MONGO_URI=$MONGO_URI
ENV JWT_SECRET=$JWT_SECRET

RUN echo "MONGO_URI=${MONGO_URI}" > .ENV
RUN echo "${JWT_SECRET}=batman" > .ENV

RUN npm i -g pnpm

RUN pnpm build

EXPOSE 3010

CMD [ "node", "dist/main.js" ]

# Dados MongoDB
# songshik
# GBjjCF26BrjGlT9v
# mongodb+srv://songshik:<password>@pos-tech-estoque.qsbmq42.mongodb.net/?retryWrites=true&w=majority&appName=pos-tech-estoque
# mongodb+srv://songshik:GBjjCF26BrjGlT9v@pos-tech-estoque.qsbmq42.mongodb.net/?retryWrites=true&w=majority&appName=pos-tech-estoque
# docker build -t prdutos_estoque:latest  --build-arg="MONGO_URI=mongodb+srv://songshik:GBjjCF26BrjGlT9v@pos-tech-estoque.qsbmq42.mongodb.net/?retryWrites=true&w=majority&appName=pos-tech-estoque" --build-arg="JWT_SECRET=batman" .
# docker build -t prdutos_estoque:latest  --build-arg="MONGO_URI=mongodb+srv://songshik:GBjjCF26BrjGlT9v@pos-tech-estoque.qsbmq42.mongodb.net/pos-tech-estoque" --build-arg="JWT_SECRET=batman" .