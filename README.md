[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx)   
<img src="https://user-images.githubusercontent.com/96490382/185179903-4cbac04d-d0f7-47e2-b81a-167803205d33.png" width="800"/>  
<h2>Internet bonding router with seamless failover using Speedify (primarily)</h2> 

<i>SmoothWAN</i> is a custom [OpenWRT](https://openwrt.org/) router distribution for fixed internet bonding setup using Speedify primarily, with an emphasis on using an internet browser for easy configuration. <br>  
This project is not affiliated with Speedify or Connectify.<br>

Also includes <a href="https://smoothwan.com/engarde/">Engarde</a> and <a href="https://smoothwan.com/tinyfec/">TinyFEC VPN</a> as alternative and self-hosting solutions.<br>


Visit the documentation at [SmoothWAN website](https://www.smoothwan.com) or [Github Pages](http://smoothwan.github.io/SmoothWAN-docs) for information and guides.    

*Supported hardware*

- PC Intel/AMD
- GL.iNet Flint
- GL.iNet Slate AX
- Raspberry Pi 4 / Pi 400
- Banana Pi R64/R3 (untested)

Only supporting devices that are difficult to brick/damage with 3rd party firmware. (no restrictions + locked bootloader)

*Use cases*

- Use Speedify to build a reliable internet access with seamless failover, lossless and aggregated single-flow speeds by bonding two or more connections, preferably a combination of wired and wireless with baseline ISP plans as an affordable solution. e.g rural areas, developing countries...
- Cover all connected devices in a home network when it's not possible or practical to share a WAN per each device running Speedify.  
- Use <a href="https://smoothwan.com/engarde/">Engarde</a> as an self-hosting alternative to Speedify's Redundant mode (lossless by duplicating traffic across WANs - no aggregation)
- Use <a href="https://smoothwan.com/tinyfec/">TinyFEC VPN</a> for fixing a lossy unusable internet connection using forward-error-correction (single WAN - self-hosting)
- Low budget alternative to commonly used solutions
- Backpack streaming setup. (RTMP and others are possible in LXC)

*Additional features*

- AdGuard Home pre-installed and pre-configured (one-click enable) with password change UI addition
- Custom Speedify version selection and tune/tweaks (bypasses)
- Preset network configuration for various hardware
- Unique interface ID for USB ports
- VPN PBR pre-configured
- Tailscale installer and pre-configuration
- <a href="https://www.ntop.org/products/traffic-analysis/ntop/">ntopng</a> (deep-packet-inspection analysis) installer
- One-click cloud-init script for setting up Engarde & TinyFEC VPN in cloud
- <a href="https://smoothwan.com/tips/#identifying-client-using-p2p-or-bittorrent">BitTorrent detection log</a> showing client IP address as the source
- Per-client (LAN) bandwidth limiter (EQoS)

*Typical setup*  
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="600"/>

***
  
**WebUI preview**  
  
<img src="https://user-images.githubusercontent.com/96490382/208723215-92bb40df-c56d-4f82-b597-707aa8e35f7b.gif" width="500"/>
