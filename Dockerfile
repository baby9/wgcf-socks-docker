FROM --platform=$TARGETPLATFORM alpine/socat
ARG TARGETARCH
EXPOSE 40000
WORKDIR /app

COPY resources/sb-example.json ./
COPY wget.sh entrypoint.sh ./

RUN true && \
	sh wget.sh && \
	chmod +x WarpRegister sing-box

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
