FROM golang:1.17.6-alpine AS build
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .
RUN go mod tidy
RUN go build

FROM alpine:3.15
WORKDIR /app
COPY --from=build /app/kubetest /usr/local/bin/kubetest
ENTRYPOINT [ "kubetest" ]