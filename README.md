[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx)   
<img src="https://user-images.githubusercontent.com/96490382/185179903-4cbac04d-d0f7-47e2-b81a-167803205d33.png" width="400"/>

## Internet bonding router using Speedify
An OpenWRT router OS for fixed internet bonding setup using Speedify with a browser only. <br>
Not affiliated with Speedify or Connectify.<br>
<br>
Use cases: 
- Build a reliable internet access with seamless failover, lossless and usable single-flow speeds by bonding two or more connections, preferably a combination of wired and wireless with baseline ISP plans as an afforadable solution. e.g rural areas, developing countries...
- Cover all connected devices in a home network when it's not possible or practical to share a WAN per each device running Speedify.  
- Low budget alternative to commonly used solutions
- Backpack streaming setup. (RTMP and others in LXC)
  
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="600"/> <br>  
<sub>[- More info on Pi's Wi-Fi setup](https://github.com/TalalMash/SmoothWAN/discussions/18#discussioncomment-2521688)<br>- Slate AX/Flint is much easier to setup with no extra hardware.</sub>  
  
 ***
  
<details>
  <summary><b>Quick setup using a smartphone as an example</b></summary>  
<b>Note:</b> Slate AX or Flint is recommended for ease of use due to built in stable Wi-Fi adapters, no extra hardware is needed.<br>
- Download and follow the instructions from "Releases" page. <br>
- Connect your hardware in a similiar way to this example: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1a.svg" width="400"/>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1slate.svg" width="400"/><br>
- The Pi/Slate is now broadcasting as a Wi-Fi access point for easy configuration, connect to "SmoothWAN Setup", password: "brassworld": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1.png" width="300"/> <br>
- Visit: http://172.17.17.2 there is no password set: <br>
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
- Speedify app is now installed, login: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/8.png" width="300"/> <br>
- Setup a password for SmoothWAN admin page in System->Administration <br>
- All done, enjoy a reliable internet. <br>

***

- <b>Extra</b>: to change the USB ports / WAN name, head to Interfaces->Multi-WAN USB: <br> 
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/11.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/12.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/13.png" width="300"/> <br>
- <b>Pi specifics:</b>
  - Connect and configure a Wi-Fi AP/router if needed, the internal Wi-Fi of the Pi is unstable for general use, connect using RPi4's Ethernet port to a configured AP/router [(more info)](https://github.com/TalalMash/SmoothWAN/discussions/18#discussioncomment-2521688): <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2a.svg" width="300"/> <br>
  - After connecting your mobile over the Wi-Fi AP/router, head over to Network->Wireless and disable Pi's Wi-Fi: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/9.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/10.png" width="800"/> <br>

</details>

<details> 
<summary>Speedify in technical terms</summary>
<b>Notes:</b> These are my own findings and they are not accurate. <br>
<br>
- Includes optimization for non-livestreaming services in addition to livestreaming, e.g realtime connections. <br>
- Relatively affordable due to publicly shared servers. <br>
- Server region selection for region restricted services and multiple backup public servers. <br>
- Application aware conditioning in "Streaming mode": sensitive streams packets (when detected) are duplicated across WANs and prioritized for VoIP, video calls, streaming, and games for seamless failover and lossless connectivity even when combining lossy WANs. While non-sensitive streams packets are aggregated across WANs for the speed of the total combined WANs, and bulk downloads using single sockets are aggregated. Sensitive streams are also aggregated with high quality sources. <br>
- Advanced quality monitoring: per WAN quality rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. e.g WAN resume and suspend delay is increased on multiple failures, poor connections will be removed from aggregation and used for backup etc. <br>
- Automatic bypass function for region/VPN restricted services. e.g Netflix <br>
- Per WAN VPN transport protocols for optimal connectivity when used with strict ISPs or poor middleboxes, used protocols: HTTPS(disguises as web browsing), UDP, TCP, TCP Multiple. <br>
- "TCP Multiple" transport protocol as known as parallel transfer sockets allows maximum speed to be achieved on high latency, lossy, and far region VPN servers (with loss based CCA host settings and out-of-order packets). <br>
- Quick packet aggregation weighing for largely asymmetric and heterogenous WANs bonding while slowly adapting on long periods when using cellular/wireless with variable speeds. <br>
- Low out of order packet delivery on aggregation, needed for single socket TCP connection performance at the cost of minor latency increase. <br>
- Options for using a WAN for speed boosts only with adjustable threshold (advanced - CLI) and backup only mode. <br>
- Switching critical settings such as protocols, modes, and adding or removing WANs without disruption or requiring a restart. <br>
- Maintains low TCP-over-TCP overhead relative to other VPNs. <br>
  
</details>
  
 ***
  
Platforms: GL.iNet Flint/Slate AX, Raspberry Pi 4 / Pi 400, and 64-bit PC
<br><br>
Additional features: 
-  USB port agnostic for portable setups using persistent WAN configuration & naming by using MAC-addr for USB Ethernet adapters, 4G USB dongles* (RNDIS, Pi/PC)  
-  Preset configuration for USB Ethernet adapters and tethering devices for plug and play (Pi/PC) with interface renaming.  
-  Bypass Speedify with selective WAN for local devices/ports/domains using a PBR and/or Speedify's internal bypass with a LuCI app for adaptive WAN selection: data caps and more.
-  [Pi-hole installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Pi-hole) for local home network adblocking (Pi/PC)  
-  [AdGuard Home](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-AdGuard-Home-(GL.iNet)) pre-installed on Slate AX
-  [Tailscale installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Tailscale) for easy remote access to connected devices in your home network  
-  [PnP mini-display support](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-OLED-display-for-stats-(RPi4)) for displaying Speedify info (backpack streaming) 
-  Basic wireless setup menu for easy configuration with optimized presets (WIP)  
-  Per platform OpenWRT optimizations and preconfigured LuCI apps
  
<sub>*NCM & QMI USB modems require manual configration instructed by ISP, setup in "Interfaces" page.</sub>

Interactive discussion hub is hosted at Discord linked top. <br>
Checkout the [Wiki](https://github.com/TalalMash/SmoothWAN/wiki/) for more information. <br>
Use the [discussions](https://github.com/TalalMash/SmoothWAN/discussions) tab in Github for a forum-like discussion on networking configurations and Speedify topics, and [issues](https://github.com/TalalMash/SmoothWAN/issues) tab for SmoothWAN related issues.  

***

<details>
  <summary><b>Maté Donors ❤</b></summary>
  Special thanks to:<br>
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/donors.drawio.svg"/><br>
<b>Note:</b> Add *** at the end of the donation message be excempt from this list.<br>
</details>

[Buy me maté 🧉](https://www.paypal.com/paypalme/talalmsb/1)  
  
[Donate to Parrot Rescue Lebanon 🦜](https://www.parrotrescuelebanon.com/)
