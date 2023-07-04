FROM --platform=$TARGETPLATFORM alpine/socat
ARG TARGETOS
ARG TARGETARCH
EXPOSE 40000
WORKDIR /app

COPY resources/wget.sh ./
COPY resources/sb-example.json ./
COPY entrypoint.sh ./

RUN true && \
	sh wget.sh && \
	chmod +x WarpRegister sing-box

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
