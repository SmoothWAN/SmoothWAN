[![Discord](https://badgen.net/discord/members/AxSSjpgwjx)](https://discord.gg/AxSSjpgwjx) 
## A Speedify Router using OpenWRT
An easy to use OpenWRT based flavor for Speedify.
Typical use case: Deploy Speedify to your home network in minutes with few clicks and can be setup from a smartphone.

Targets: Raspberry Pi 4 and Generic x86_64 (and virtual machines) <br> <br>
Additional Features: 
-  One-click setup Multi-WAN interface setup for USB ethernet and Cellular USB dongles (RDNIS)
-  Pi-hole 
-  Tailscale (remote LAN access)


Use the discussions tab in Github for a forum-like discussion on networking configurations, and issues tab for SmoothWAN specifics.  
Interactive discussion server at Discord linked top. <br>
<details> 
<summary>Why Speedify?</summary>
- SDWAN-esque: Having one exit IP address like any VPN, sessions are uninterrupted. Data is duplicated (mirrored) across WANs for sensitive connections such as VoIP, video calls, and games for "seamless migration" on fault for the speed of the fastest WAN while simulatenously aggregating (splitting) bulk data across WANs per packet for the speed of the combined WANs as bulk data transfers tolerates instability.  <br>
- Per-WAN rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. (e.g increases faulty WAN action intervals between repetitive failures)<br>
- Per-WAN VPN transport protocol for best performance in Auto mode; Protocols: HTTPS(web browsing disguise), UDP, TCP, TCP Multi.<br>
- "TCP Multiple" transport protocol feature, A.K.A parallel transfer channels in other software, allows maximum speed to be achieved on high latency, lossy, and far VPN region servers with commonly used TCP congestion controllers. <br>
- Automatic packet aggregation weighing for largely asymmetric and heterogenous WANs. Slowly adapts to speed variations.<br>
- A buffer to prevent TCP reordering. <br>
- An option for using a WAN for boost only mode with configurable speed trigger and backup only mode (low data consumption, depends on primary WAN quality rating). <br>
- TCP transport mode implements pacing (effects: low UDP-over-TCP latency overhead, no TCP-over-TCP performance degradation) <br>
- Instant server region selection for region restricted services. Other services require fixed IP/server. <br>
- Switching critical settings such as protocols, modes, and adding new WANs without measurable disruption other than latency variation on the aggregation channel. <br>
<br>
  Most of the observations listed were observed with Speedify's log files and network simulation tools.
</details>

<details>
<summary>Basic Setup for the Raspberry Pi 4 using a smartphone</summary>
- Download the file from the sidebar and follow the instructions to setup the microSD card. <br>
- Connect as follows, the MAC address is printed on each device, usually at the back, note it down: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/usb.jpg" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1a.svg" width="400"/> <br>
- The Raspberry Pi 4 is now broadcasting as an access point for easy configuration, connect to "SmoothWAN Setup": <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/1.png" width="300"/> <br>
- Visit 192.168.3.1 in your browser and login, there is no password set: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/3.png" width="300"/> <br>
- You will be greeted with brief instructions in the UI, it's time to setup the WANs as in the diagram: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/4.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/5.png" width="300"/> <br>
- Type the name of the first ISP, "ISP1" as in this example, you can tape a label on the USB ethernet for easy identification: <br>
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
- Time to connect a WiFi AP if needed, the internal WiFi of the RPi4 is poor for general usage, connect using RPi4's Ethernet to a configured AP: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/2a.svg" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/17.png" width="300"/> <br>
- After switching over to WiFi AP, head over to 192.168.3.1 and disable internal WiFI: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/18.png" width="300"/> <br>
- Setup a password for SmoothWAN admin page: <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/19.png" width="300"/> <br>
<img src="https://github.com/TalalMash/SmoothWAN-web/raw/main/Basic%20Setup%20Guide%20assets/20.png" width="300"/> <br>
- All done, enjoy! <br>
</details>

<details>
<summary>Build from source using OpenWRT's imagebuilder</summary>
  - Grab your imagebuilder device target archive from: https://downloads.openwrt.org/releases/21.02.1/targets/ <br>
  - Copy files, packages, and the corresponding build.sh and .config from devconfigs folder for your device to imagebuilder root. <br>
  - Run "sh build.sh" <br>
  - Images will be located in bin/<device target> <br>
</details><br>

[Donate ☕ beans](https://www.paypal.com/paypalme/talalmsb/1)
