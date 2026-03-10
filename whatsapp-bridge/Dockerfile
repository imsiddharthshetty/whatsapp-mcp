FROM golang:1.25-alpine AS builder

# CGO is required for go-sqlite3
RUN apk add --no-cache gcc musl-dev

WORKDIR /app
COPY go.mod go.sum ./
COPY . .
RUN go mod tidy
RUN CGO_ENABLED=1 go build -o whatsapp-bridge .

FROM alpine:3.19
RUN apk add --no-cache ca-certificates
RUN adduser -D -s /bin/sh appuser
WORKDIR /app

COPY --from=builder /app/whatsapp-bridge .
RUN mkdir -p /app/store && chown appuser:appuser /app/store

USER appuser
EXPOSE 8080

CMD ["./whatsapp-bridge"]
