FROM golang:alpine as BUILDER
WORKDIR /home/mjnk9xw/go/src/TrustKeys/VTP/Test/testlog
COPY . .
RUN go mod vendor
RUN GOOS=linux go build -o main
FROM alpine
EXPOSE 80
WORKDIR /app
COPY --from=BUILDER /home/mjnk9xw/go/src/TrustKeys/VTP/Test/testlog/main /app
CMD /app/main