FROM golang:1.24-alpine AS builder
WORKDIR /api

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o service ./cmd/service

FROM alpine:latest
WORKDIR /opt/

COPY --from=builder /api/service .

EXPOSE 80

CMD ["./service"]
