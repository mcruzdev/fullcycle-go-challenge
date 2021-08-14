FROM golang AS builder

WORKDIR /workspace/app

COPY ./src .

RUN go build -o binaries main.go

FROM scratch

COPY --from=builder /workspace/app/binaries .

ENTRYPOINT [ "./main" ]


