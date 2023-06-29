
Cloudflare WARP (WireGaurd protocol) run in containerized environment.

## Features
- No privilege required
- Arm architecture support
- Works in HK & LA (WireGuard reserved field bytes support)
<br/><br/>
## Usage

```
docker run -d -p 40000:40000 --restart=unless-stopped zenexas/wgcf-socks:latest
```
With socks user and password:

```
docker run -d -p 40000:40000 -e SOCKS_USER="" -e SOCKS_PASSWORD="" --restart=unless-stopped zenexas/wgcf-socks:latest
```
Socks5 proxy server will be listening at port 40000.
<br/><br/>
#### RUN :
No password:
```
curl -s4m8 -x socks5://127.0.0.1:40000 https://www.cloudflare.com/cdn-cgi/trace | grep warp
```
With password:
```
curl -s4m8 --socks5 user:password@127.0.0.1:40000 https://www.cloudflare.com/cdn-cgi/trace | grep warp
```
Test your warp account type
<br/><br/>
````
curl -s -x socks5://127.0.0.1:40000 https://ipinfo.io
````
Lookup your warp ip location
<br/><br/>
````
curl -x socks5://127.0.0.1:40000 https://speed.cloudflare.com/__down?bytes=1000000000 > /dev/null
````
Speedtest
<br/><br/>
## Notice
- Require Linux Kernel ≥ 5.6 on host machine (Wireguard required)
<br/><br/>
## Reference
- [warp-reg](https://github.com/badafans/warp-reg) - Register WARP account via CloudFlare's API
- [sing-box](https://github.com/SagerNet/sing-box) - A powerful proxy platform instead of [wgcf](https://github.com/ViRb3/wgcf)

