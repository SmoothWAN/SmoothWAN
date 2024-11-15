**Project sunset after 3 years for the following reasons**
- [Speedify officially supports OpenWrt as of Q4 2024](https://support.speedify.com/article/918-openwrt)
- GL.iNet auto build repos went private, certain patches for [wlan-ap](https://github.com/gl-inet/wlan-ap) are missing.
- Wi-Fi 6+ is unstable with OpenWrt official firmware for GL.iNet and most routers.
- Speedify now requires a [seperate subscription for routers](https://speedify.com/store/#routers) and the pricing is very steep for me.

The firmware should work for a good while and the Speedify installer has a URL entry that can be updated.

[Discourse archive](https://smoothwan.discourse.group/)

Wiki site address mirror to [Github pages](https://smoothwan.github.io/SmoothWAN-docs-mirror)

Discord chat has not been archived for user privacy reasons.
Thank you contributors, Speedify support, and donors!

**[Donate to Parrot Rescue Lebanon if you found this helpful 🦜](https://www.parrotrescuelebanon.com/)**


***

<img src="https://user-images.githubusercontent.com/96490382/185179903-4cbac04d-d0f7-47e2-b81a-167803205d33.png" width="600"/>  
<h2>DIY Internet bonding router with seamless failover using Speedify</h2> 

<i>SmoothWAN</i> is a custom [OpenWRT](https://openwrt.org/) router distribution for fixed internet bonding setup using Speedify, with an emphasis on using an internet browser for easy configuration on the go. <br>  
This project is not affiliated with Speedify or Connectify.<br>

As of Q4 2024, Speedify now requires a [license for routers](https://speedify.com/store/#routers).

Also includes <a href="https://github.com/porech/engarde">Engarde</a> and <a href="https://github.com/wangyu-/tinyfecVPN">TinyFEC VPN</a> as alternative and self-hosting solutions.<br>


Visit the [wiki](https://smoothwan.com) for information and guides.    

*Supported hardware*
(order by performance)

- PC Intel/AMD
- Raspberry Pi 4 / Pi 400
- GL.iNet Flint
- GL.iNet Slate AX

Only supporting devices that are difficult to brick/damage with 3rd party firmware. (read-only bootloader from webpage upgrade)

~For running on other hardware or existing OpenWrt users you can use the unofficial installer [here](https://github.com/TalalMash/Unofficial-Speedify-Installer-For-OpenWrt)~
[Speedify officially supports OpenWrt as of Q4 2024](https://support.speedify.com/article/918-openwrt)

***

*Use cases*

- Run a VPN over Speedify to bypass captcha/IP-blocking on public servers or other uses.
- Cover all connected devices in a home network when it's not possible or practical to share a WAN per each device running Speedify such as IoT and security systems.  
- Use [Engarde](https://github.com/porech/engarde) as self-hosting alternative to Speedify's Redundant mode (lossless by duplicating traffic across WANs - no aggregation)
- Use [TinyFEC VPN](https://github.com/wangyu-/tinyfecVPN) for fixing a lossy unusable internet connection using forward-error-correction at a speed cost (single WAN - self-hosting)

[and more...](https://smoothwan.com/features/)


***

**Typical setup**
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="600"/>

***
  
**WebUI preview**  
  
<img src="https://user-images.githubusercontent.com/96490382/208723215-92bb40df-c56d-4f82-b597-707aa8e35f7b.gif" width="500"/>
