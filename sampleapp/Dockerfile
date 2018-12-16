FROM golang:alpine AS build_base

RUN apk update --no-cache && apk add git
WORKDIR /app

ENV GO111MODULE=on

COPY go.mod .
COPY go.sum .

RUN go mod download

ADD ./ /app

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o grafana-loki-test  .

FROM alpine
WORKDIR /app
COPY --from=build_base /app/grafana-loki-test /app

ENTRYPOINT ["/app/grafana-loki-test"]

EXPOSE 8000