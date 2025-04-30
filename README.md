**Project sunset**

[Speedify officially supports OpenWrt, requiring a license as of Q4 2024](https://support.speedify.com/article/918-openwrt)

[Discourse archive](https://smoothwan.github.io/SmoothWAN-forum-archive/smoothwan.discourse.group/)

[Wiki Mirror](https://smoothwan.github.io/SmoothWAN-docs-mirror)


***

<img src="https://user-images.githubusercontent.com/96490382/185179903-4cbac04d-d0f7-47e2-b81a-167803205d33.png" width="600"/>  
<h2>DIY Internet bonding router with seamless failover using Speedify</h2> 

<i>SmoothWAN</i> is a custom [OpenWRT](https://openwrt.org/) router distribution for fixed internet bonding setup using Speedify, with an emphasis on using an internet browser for easy configuration on the go. <br>  
This project is not affiliated with Speedify or Connectify.<br>


Also includes <a href="https://github.com/porech/engarde">Engarde</a> and <a href="https://github.com/wangyu-/tinyfecVPN">TinyFEC VPN</a> as alternative and self-hosting solutions.<br>


Visit the [wiki](https://smoothwan.com) for information and guides.    

*Supported hardware*
(order by performance)

- PC Intel/AMD
- Raspberry Pi 4 / Pi 400
- GL.iNet Flint
- GL.iNet Slate AX

Only supporting devices that are difficult to brick/damage with 3rd party firmware. (read-only bootloader from webpage upgrade)

For running on other hardware or existing OpenWrt users you can use the unofficial installer [here](https://github.com/TalalMash/Unofficial-Speedify-Installer-For-OpenWrt)

***

*Use cases*

- Run a VPN over Speedify to bypass captcha/IP-blocking on public servers.
- Cover all connected devices in a home network when it's not possible or practical to share a WAN per each device running Speedify such as IoT and security systems.  
- Use [Engarde](https://github.com/porech/engarde) as a self-hosting alternative to Speedify's Redundant mode.
- Use [TinyFEC VPN](https://github.com/wangyu-/tinyfecVPN) for fixing a lossy but fast single internet connection using forward-error-correction.

[and more...](https://smoothwan.com/features/)


***

**Typical setup**

<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="600"/>

***
  
**WebUI preview**  
  
<img src="https://user-images.githubusercontent.com/96490382/208723215-92bb40df-c56d-4f82-b597-707aa8e35f7b.gif" width="500"/>
