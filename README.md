[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx) 
## Whole-home network VPN internet bonding gateway with Speedify
An easy to use OpenWRT build for Speedify. Not affiliated with Speedify or Connectify. <br>
<br>
Typical use case examples: 
- Use Speedify as a VPN to cover all connected devices in a home network.
- Access to internet that is very reliable with usable speeds in a rural area with poor connectivity by bonding at least 2 connections with Speedify, preferably a combination of wired and wireless.

Platforms: Raspberry Pi 4 and PC <br>

Additional features requiring no command line usage: 
-  One-click setup for multiple WANs for USB Ethernet adapters, Cellular USB dongles (RNDIS), and onboard multiport Ethernet
-  Modified "VPNBypass" app with selective WAN for bypassing Speedify to custom local devices/ports/domains
-  Pi-hole for home network adblocking
-  Tailscale for remote access to connected devices in your home network
-  Basic wireless setup menu for easy configuration with optimized presets


Use the discussions tab in Github for a forum-like discussion on networking configurations and Speedify topics, and issues tab for SmoothWAN related issues.  
Interactive discussion hub is hosted at Discord linked top. <br>

<details>
<summary>Basic Setup for the Raspberry Pi 4 using a smartphone</summary>
- Download the file from the sidebar and follow the instructions to setup the microSD card. <br>
- Connect as the following diagram, the MAC address is printed on each device usually at the back, note it down: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/usb.jpg" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1a.svg" width="400"/> <br>
- The Raspberry Pi 4 (RPi4) is now broadcasting as a WiFi access point for easy configuration, connect to "SmoothWAN Setup", password: "brassworld": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1.png" width="300"/> <br>
- Visit 192.168.3.1 in your browser and login, there is no password set: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/3.png" width="300"/> <br>
- You will be greeted with brief instructions in the UI, it's time to setup the WANs as in the diagram: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/4.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/5.png" width="300"/> <br>
- Type the name of the first ISP, "ISP1" used in this example, you can tape a label on the USB ethernet for easy identification: <br>
  <img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/6.png" width="300"/> <br>
  <img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/7.png" width="300"/> <br>
- Notice the last 6 charchters in newdev, select the correct ending address for the USB ethernet that's plugged in to "ISP1" as you noted the addresses before, click Save and Apply and add the same for ISP2 and more: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/8.png" width="300"/> <br>
- Time to install Speedify! Head over to VPN->Speedify: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/9.png" width="300"/> <br>
- Click "Trigger Install/Update": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/10.png" width="300"/> <br>
- Click "View Log" tab, it should read as "Speedify is installed" at the end of the line: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/11.png" width="300"/> <br>
- Head to Status->Overview: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/12.png" width="300"/> <br>
- You will be greeted with Speedify app, login: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/13.png" width="300"/> <br>
- Navigate to settings, and enable "Connect at Startup": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/14.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/15.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/16.png" width="300"/> <br>
- Time to connect and configure a WiFi AP/router if needed, the internal WiFi of the RPi4 is poor for general usage, connect using RPi4's Ethernet to a configured AP/router: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2a.svg" width="300"/> <br>
- After switching over to WiFi AP/router, head over to 192.168.3.1 and disable internal WiFI (updated photos): <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/17-1.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/18-1.png" width="300"/> <br>
- Setup a password for SmoothWAN admin page: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/19.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/20.png" width="300"/> <br>
- All done, enjoy! <br>
</details>

<details> 
<summary>Speedify compared to current consumer-grade bonding solutions</summary>
- SD-WAN, QoS and traffic type aware: By having one exit IP address (VPN) when bonding, connected network sessions are uninterrupted. Sensitive data is mirrored across WANs and prioritized for VoIP, video calls, streaming, and games for seamless failover and lossless connectivity even when combining lossy WANs. While non-sensitive data is aggregated across WANs for the speed of the total combined WANs, including single data streams/sockets.  <br>
- Per WAN quality rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. (e.g will suspend a WAN on multiple failures, resume and suspend delay is increased on multiple failures) <br>
- Per WAN VPN transport protocols for optimal connectivity when used with strict ISPs or poor middleboxes, used protocols: (Automatic detection), HTTPS(disguises as web browsing), UDP, TCP, TCP Multiple. <br>
- "TCP Multiple" transport protocol as known as parallel transfer streams allows maximum speed to be achieved on high latency, lossy, and far region VPN servers (with loss based CCA host settings and out-of-order packets). <br>
- Automatic packet aggregation weighing for largely asymmetric and heterogenous WANs. Slowly adapts to speed variations when using cellular/wireless. <br>
- No out of order packet delivery on aggregation. <br>
- An option for using a WAN for speed boosts only and backup only mode, data consumption usage depends on primary WAN quality rating in backup mode for seamless failover. <br>
- Switching critical settings such as protocols, modes, and adding or removing WANs without disruption. <br>
- TCP transport modes implements pacing for low bufferbloat and low RTT for thin streams. <br>
- Instant server region selection for region restricted services. <br>
- Relatively affordable and does not require setting up a server. <br>
</details>

<details>
<summary>Advanced: Build from source using OpenWRT's imagebuilder</summary>
  - Grab your imagebuilder device target archive from: https://downloads.openwrt.org/releases/21.02.1/targets/ <br>
  - Clone repo and copy the corresponding device from devconfigs and packages to imagebuilder root. <br>
  - Run "sh build.sh" <br>
  - Images will be located in bin/<device target>
  - Note: For compiling SmoothWAN packages, compile smoothwan-feeds with OpenWRT build system. Pre-compiled packages are included for easy customization, quick builds and imagebuilder-only setup. <br>
</details><br>

[Donate ☕ beans](https://www.paypal.com/paypalme/talalmsb/1)

