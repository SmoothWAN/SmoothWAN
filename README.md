[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx) 
## Home network internet bonding with Speedify
Setup Speedify as a gateway using OpenWRT without command line usage. <br>Not affiliated with Speedify or Connectify.<br>
<br>
Typical use case examples: 
- Use Speedify as a VPN to cover all connected devices in a home network when it's not practical to share a WAN.
- Access to a reliable internet with usable speeds in a rural area with poor connectivity by bonding at least 2 connections with Speedify, preferably a combination of wired and wireless. Speedify is optimized for livestreaming and mixed usage, most services are optimized for livestreaming only (2022).

  
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="400"/> <br>
  
 ***
  
<details>
<summary>Basic Setup for the Raspberry Pi 4 using a smartphone</summary>
  
- Download the file from the sidebar and follow the instructions to setup the microSD card. <br>
- Connect as the following diagram: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1a.svg" width="400"/> <br>
- The Raspberry Pi 4 (RPi4) is now broadcasting as a WiFi access point for easy configuration, connect to "SmoothWAN Setup", password: "brassworld": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1.png" width="300"/> <br>
- Visit 192.168.3.1 in your browser and login, there is no password set: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/3.png" width="300"/> <br>
- You will be greeted with brief instructions in the UI, setup Speedify: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/4.png" width="300"/> <br>
- Click "Trigger Install/Update": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/5.png" width="300"/> <br>
- Click "View Log" tab, it will show "Speedify is installed" at the end of the log after few seconds: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/6.png" width="300"/> <br>
- Head to Status->Overview: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/7.png" width="300"/> <br>
- You will be greeted with Speedify app, login: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/8.png" width="300"/> <br>
- Navigate to settings, and enable "Connect at Startup": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/9.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/10.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/11.png" width="300"/> <br>
- Time to connect and configure a Wi-Fi AP/router if needed, the internal Wi-Fi of the RPi4 is poor for general usage, connect using RPi4's Ethernet to a configured AP/router: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2a.svg" width="300"/> <br>
- After switching over to Wi-Fi AP/router, head over to Network->Wireless (Basic) and disable internal Wi-Fi: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/12.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/13.png" width="300"/> <br>
- Setup a password for SmoothWAN admin page in System->Administration <br>
- All done, enjoy! <br>

***

- <b>Extra</b>: to change the USB ports / WAN name, head to Interfaces->Multi-WAN USB: <br> 
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/14.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/15.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/16.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/17.png" width="300"/> <br>

</details>

<details> 
<summary>Speedify compared to current consumer-grade bonding solutions</summary>
  
- SDN VPN: By having one exit IP address when bonding, connected network sessions are uninterrupted. Sensitive streams are mirrored across WANs and prioritized for VoIP, video calls, streaming, and games for seamless failover and lossless connectivity even when combining lossy WANs. While non-sensitive streams are aggregated across WANs for the speed of the total combined WANs, and bulk downloads using single sockets are aggregated. Sensitive streams are also aggregated with high quality sources. <br>
- Per WAN quality rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. (e.g will suspend a WAN on multiple failures, resume and suspend delay is increased on multiple failures) <br>
- Per WAN VPN transport protocols for optimal connectivity when used with strict ISPs or poor middleboxes, used protocols: HTTPS(disguises as web browsing), UDP, TCP, TCP Multiple. <br>
- "TCP Multiple" transport protocol as known as parallel transfer sockets allows maximum speed to be achieved on high latency, lossy, and far region VPN servers (with loss based CCA host settings and out-of-order packets). <br>
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
  - Images will be located in bin/<device target> <br>
  - Note: For compiling SmoothWAN packages, compile smoothwan-feeds with OpenWRT build system. Pre-compiled packages are included for easy customization, quick builds and imagebuilder-only setup. <br>
</details>
  
 ***
  
Platforms: Raspberry Pi 4 and PC  
<br>
Additional features: 
-  PnP and simple WAN configuration and renaming for USB Ethernet adapters, 4G USB dongles* (RNDIS), and onboard multiport Ethernet.
-  USB Ethernet adapters and tethering devices are plug and play (Raspberry Pi 4 only - DHCP)
-  Bypass Speedify with selective WAN for local devices/ports/domains using [VPNBypass](https://docs.openwrt.melmac.net/vpnbypass/)
-  [Pi-hole installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Pi-hole) for home network adblocking
-  [Tailscale installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Tailscale) for remote access to connected devices in your home network
-  Basic wireless setup menu for easy configuration with optimized presets  
  
<sub>*NCM & QMI USB modems require manual configration instructed by ISP, setup in "Interfaces" page.</sub>


Use the discussions tab in Github for a forum-like discussion on networking configurations and Speedify topics, and issues tab for SmoothWAN related issues.  
Interactive discussion hub is hosted at Discord linked top. <br>

[Donate ☕ beans](https://www.paypal.com/paypalme/talalmsb/1)


