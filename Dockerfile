FROM --platform=$TARGETPLATFORM golang:alpine AS build
WORKDIR /build
COPY build/WarpRegister.go .
RUN true && \
    go mod init WarpRegister && \
    go mod tidy && \
    CGO_ENABLED=0 go build -o output/WarpRegister -ldflags '-s -w -extldflags "-static"'

FROM --platform=$TARGETPLATFORM alpine
ARG TARGETOS TARGETARCH
EXPOSE 40001 40002
WORKDIR /app

COPY res .
COPY --from=build /build/output/WarpRegister .
COPY entrypoint.sh .

RUN true && \
	sh get-sb.sh && \
	chmod +x WarpRegister sing-box

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
