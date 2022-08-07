[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx) 
## Internet bonding router using Speedify
A router OS for easy bonding setup using Speedify as the main gateway with OpenWRT without command line usage. <br>Not affiliated with Speedify or Connectify.<br>
<br>
Use case: 
- Build a reliable internet access with seamless failover, lossless and usable single-flow speeds by bonding two or more connections, preferably a combination of wired and wireless with baseline ISP plans.
- Use Speedify as an SDN bonding VPN to cover all connected devices in a home network when it's not possible or practical to share a WAN per device.  
- Backpack streaming setup.
  
<img src="https://raw.githubusercontent.com/TalalMash/SmoothWAN-web/main/smoothwan-illust.drawio.svg" width="400"/> <br>  
<sub>Pi Update regarding router/AP section: It's advisable to turn off DHCP in router/AP settings and plug SmoothWAN to LAN.</sub>
  
 ***
  
<details>
  <summary><b>Quick Setup using a smartphone</b></summary>
  
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
  - Connect and configure a Wi-Fi AP/router if needed, the internal Wi-Fi of the Pi is poor for general use, connect using RPi4's Ethernet port to a configured AP/router [(more info)](https://github.com/TalalMash/SmoothWAN/discussions/18#discussioncomment-2521688): <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2a.svg" width="300"/> <br>
  - After connecting your mobile over the Wi-Fi AP/router, head over to Network->Wireless and disable Pi's Wi-Fi: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/9.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/10.png" width="300"/> <br>

</details>

<details> 
<summary>Speedify observed details in Q4 2022</summary>

- Relatively affordable and does not require setting up a server. <br>
- Includes optimization for non-streaming services.  <br>
- Instant server region selection for region restricted services and multiple backup public servers. <br>
- SDN VPN: By having one exit IP address, connected network sessions are uninterrupted by flow control: sensitive streams packets are duplicated across WANs and prioritized for VoIP, video calls, streaming, and games for seamless failover and lossless connectivity even when combining lossy WANs. While non-sensitive streams packets are aggregated across WANs for the speed of the total combined WANs, and bulk downloads using single sockets are aggregated. Sensitive streams are also aggregated with high quality sources. <br>
- FEC using existing DTLS(?) encryption. <br>
- Per WAN quality rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. e.g WAN resume and suspend delay is increased on multiple failures, poor connections will be removed from aggregation and used for backup etc. <br>
- Per WAN VPN transport protocols for optimal connectivity when used with strict ISPs or poor middleboxes, used protocols: HTTPS(disguises as web browsing), UDP, TCP, TCP Multiple. <br>
- "TCP Multiple" transport protocol as known as parallel transfer sockets allows maximum speed to be achieved on high latency, lossy, and far region VPN servers (with loss based CCA host settings and out-of-order packets). Also circumvents poor ISP restrictions. <br>
- Quick packet aggregation weighing for largely asymmetric and heterogenous WANs. Slowly adapts to speed variations when using cellular/wireless. <br>
- Low out of order packet delivery on aggregation, needed for single socket TCP connection performance. <br>
- An option for using a WAN for speed boosts only and backup only mode, data consumption usage depends on primary WAN quality rating in backup mode for seamless failover. <br>
- Switching critical settings such as protocols, modes, and adding or removing WANs without disruption. <br>
- TCP transport modes with low RTT and low TCP-over-TCP overhead. <br>

  
</details>
  
 ***
  
Platforms: Slate AX, Raspberry Pi 4 / Pi 400, and 64-bit PC
<br>
Additional features: 
-  USB port agnostic for portable setups using persistent WAN configuration by MAC-addr for USB Ethernet adapters, 4G USB dongles* (RNDIS, Pi/PC)  
-  Preset configuration for USB Ethernet adapters and tethering devices for plug and play (Pi/PC) with interface renaming.  
-  Bypass Speedify with selective WAN for local devices/ports/domains using a PBR and/or Speedify's internal bypass LuCI app (Smart WAN selection) 
-  [Pi-hole installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Pi-hole) for local home network adblocking (Pi-only)  
-  AdGuard Home pre-installed on Slate AX
-  [Tailscale installer](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-Tailscale) for easy remote access to connected devices in your home network  
-  [PnP mini-display support](https://github.com/TalalMash/SmoothWAN/wiki/Setting-up-OLED-display-for-stats-(RPi4)) for displaying Speedify info (backpack streaming)  
-  Basic wireless setup menu for easy configuration with optimized presets (WIP)  
  
<sub>*NCM & QMI USB modems require manual configration instructed by ISP, setup in "Interfaces" page.</sub>


Use the discussions tab in Github for a forum-like discussion on networking configurations and Speedify topics, and issues tab for SmoothWAN related issues.  
Interactive discussion hub is hosted at Discord linked top. <br>
Libraries/Apps used are mentioned in Wiki. Credits are mentioned per release. <br>

<details> 
  <summary><b>Credits</b></summary>
  @: Github - d@: Discord - a@:anonymous <br>
  <b>Donors(a-z):</b>  <br>
  @bt61 d@FloppyDisk @hle5128 d@mattmatt a@Max** d@pedro84 a@Ron** d@sqlazer <br>
</details>

[Buy me maté 🧉](https://www.paypal.com/paypalme/talalmsb/1)
