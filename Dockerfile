FROM node:18-alpine3.15

WORKDIR /app
COPY client/ .
RUN npm install
RUN npm build

FROM golang:1.19-alpine3.15

ADD go.mod go.sum ./
RUN go mod download
ADD . .
COPY --from=build-node /app/dist ./client/dist

RUN go build -o /main

FROM alpine:3.15
COPY --from=build-go /main /main
ENTRYPOINT [ "/main" ]
