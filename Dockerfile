FROM alpine/socat
EXPOSE 40000
WORKDIR /app

COPY resources/sb-example.json ./
COPY entrypoint.sh ./

RUN true && \
	wget https://github.com/badafans/warp-reg/releases/download/v1.0/main-linux-amd64 -O WarpRegister && \
	wget https://github.com/SagerNet/sing-box/releases/download/v1.3.0/sing-box-1.3.0-linux-amd64.tar.gz && \
	tar xvf sing-box-1.3.0-linux-amd64.tar.gz && \
	mv sing-box-1.3.0-linux-amd64/sing-box . && \
	rm -rf sing-box-* && \
	chmod +x WarpRegister sing-box

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
