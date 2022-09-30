FROM golang as builder
WORKDIR /app

COPY . /app/

RUN CGO_ENABLED=0 go build -ldflags "-extldflags -static -s -w" -o bin/local-path-provisioner

FROM alpine
COPY --from=builder /app/bin/local-path-provisioner /usr/local/bin/
CMD ["local-path-provisioner"]
