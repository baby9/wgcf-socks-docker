
Cloudflare WARP (WireGaurd protocol) run in containerized environment.

## Features
- No privilege required
- Arm architecture support
- Works in HK & LA (WireGuard reserved field bytes support)
<br/><br/>
## Usage

```
docker run -d -p 40001:40001 -p 40002:40002 --restart=unless-stopped zenexas/wgcf-socks:latest
```
- Socks5 proxy server listening on port 40001.
- HTTP proxy server listening on port 40002.
<br/><br/>
#### RUN :
```
curl -sx socks5://127.0.0.1:40001 https://www.cloudflare.com/cdn-cgi/trace | grep warp
```
Print your warp account type
<br/><br/>
````
curl -s -x http://127.0.0.1:40002 https://ipinfo.io
````
Lookup your warp ip location
<br/><br/>
````
curl -x socks5://127.0.0.1:40001 https://speed.cloudflare.com/__down?bytes=1000000000 > /dev/null
````
Speedtest
<br/><br/>
## Notice
- ~Require Linux Kernel ≥ 5.6 on host machine (Wireguard required)~
<br/><br/>
## Reference
- [warp-reg](https://github.com/badafans/warp-reg) - Register WARP account via CloudFlare's API
- [sing-box](https://github.com/SagerNet/sing-box) - A powerful proxy platform instead of [wgcf](https://github.com/ViRb3/wgcf)

