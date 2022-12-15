FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . ./

RUN go build -o /cl-webhook-sentry

EXPOSE 9090

CMD /cl-webhook-sentry conf.yaml