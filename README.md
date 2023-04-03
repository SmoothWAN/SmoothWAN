[![Discourse](https://user-images.githubusercontent.com/96490382/224407817-9e2cef2a-6c51-4a71-90c4-8a48633b51bf.png)](https://smoothwan.discourse.group/)

**[Donate to Parrot Rescue Lebanon 🦜](https://gofund.me/63163a6c)**  

<img src="https://user-images.githubusercontent.com/96490382/185179903-4cbac04d-d0f7-47e2-b81a-167803205d33.png" width="600"/>  
<h2>Internet bonding router with seamless failover using Speedify</h2> 

<i>SmoothWAN</i> is a custom [OpenWRT](https://openwrt.org/) router distribution for fixed internet bonding setup using Speedify, with an emphasis on using an internet browser for easy configuration on the go. <br>  
This project is not affiliated with Speedify or Connectify.<br>

Also includes <a href="https://smoothwan.com/engarde/">Engarde</a> and <a href="https://smoothwan.com/tinyfec/">TinyFEC VPN</a> as alternative and self-hosting solutions.<br>


Visit the documentation at [SmoothWAN website](https://www.smoothwan.com) or [Github Pages](http://smoothwan.github.io/SmoothWAN-docs) for information and guide.    

*Supported hardware*

- PC Intel/AMD
- GL.iNet Flint
- GL.iNet Slate AX
- Raspberry Pi 4 / Pi 400
- Banana Pi R64/R3 (untested)

Only supporting devices that are difficult to brick/damage with 3rd party firmware. (read-only bootloader with no restrictions)

*Use cases*

- Use [Speedify](https://speedify.com/) to build a reliable internet access with seamless failover, lossless and aggregated single-flow speeds by bonding two or more connections, preferably a combination of wired and wireless with baseline ISP plans as an affordable solution. e.g rural areas, developing countries...
- Cover all connected devices in a home network when it's not possible or practical to share a WAN per each device running Speedify.  
- Use [Engarde](/engarde) as an self-hosting alternative to Speedify's Redundant mode (lossless by duplicating traffic across WANs - no aggregation)
- Use [TinyFEC VPN](/tinyfec) for fixing a lossy unusable internet connection using forward-error-correction at a speed cost (single WAN - self-hosting)
- Significantly lower budget alternative to commonly used solutions (Speedify)
- Backpack streaming setup. (LXC enabled for video relay setup)

**Note: If you need to combine multiple stable internet connections above 100Mbit, consider a load balancer such as the GL.iNet Slate/Flint 4.2.0 official firmware which includes Wi-Fi and easier to setup compared to the TP-Link Multi-WAN series.**

***

**[Changes in OpenWrt](https://smoothwan.com/features/) (link)**

***

*Typical setup*  
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="600"/>

***
  
**WebUI preview**  
  
<img src="https://user-images.githubusercontent.com/96490382/208723215-92bb40df-c56d-4f82-b597-707aa8e35f7b.gif" width="500"/>
