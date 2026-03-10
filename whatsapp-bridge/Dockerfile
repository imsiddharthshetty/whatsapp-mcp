FROM golang:1.24-alpine AS builder

# CGO is required for go-sqlite3
RUN apk add --no-cache gcc musl-dev

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=1 go build -o whatsapp-bridge .

FROM alpine:3.19
RUN apk add --no-cache ca-certificates
WORKDIR /app

COPY --from=builder /app/whatsapp-bridge .

# Persistent volume mount point for SQLite databases (session + messages)
VOLUME /app/store

EXPOSE 8080

CMD ["./whatsapp-bridge"]
