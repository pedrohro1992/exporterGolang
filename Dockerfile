FROM golang:1.19.0-alpine3.16 AS buildando

WORKDIR /app
COPY . /app
RUN go build -o exporter golangExporter.go

FROM alpine:3.16
LABEL maintainer Pedro Ramos <opedroramos.oliveira@gmail.com>
LABEL description "Executando o nosso segundo exporter"
COPY --from=buildando /app/exporter /app/exporter
EXPOSE 7788
WORKDIR /app
CMD ["./exporter"]