## Custom OpenWRT build for Speedify

An easy to use OpenWRT based flavor for Speedify with no CLI requirment.  
Typical use case: Deploy Speedify to your home network in minutes with few clicks.  
Quick video tutorial to be uploaded.  


<details> 
<summary>Why Speedify?</summary>
No this is not an advertisement, here's my own testing compared to commercial and OSS alternatives at the time of this writing: <br>
<br>
- SDWAN-esque: Having one exit IP address like any VPN, it duplicates (mirror) data across WANs for sensitive connections such as VoIP, video calls, and games for "seamless migration" on fault for the speed of the fastest WAN while simulatenously aggregating (splitting) bulk data across WANs per packet for the speed of the combined WANs. (bulk data transfers tolerates hiccups). <br>
- Per-WAN rating system that's based on jitter, latency, stability, and speed variations over a period of time to prevent an unstable WAN from impacting total aggregation performance. (e.g increases faulty WAN action intervals between repetitive failures)<br>
- Per-WAN VPN transport protocol for best performance in Auto mode; Protocols: HTTPS(web browsing disguise), UDP, TCP, TCP Multi.<br>
- "TCP Multiple" transport protocol feature, A.K.A parallel transfer channels in other software, allows maximum speed to be achieved on high latency, lossy, and far VPN region servers with commonly used TCP congestion controllers. <br>
- Automatic packet aggregation weighing for largely asymmetric and heterogenous WANs. Slowly adapts to speed variations.<br>
- A buffer to reduce TCP reordering. <br>
- An option for using a WAN for boost only mode with configurable speed trigger and backup only mode (low data consumption, depends on primary WAN quality rating). <br>
- TCP transport mode implements pacing (effects: low UDP-over-TCP latency overhead, low bufferbloat.) <br>
- Instant server region selection for region restricted services. Other services require fixed IP/server. <br>
- Switching critical settings such as protocols, modes, and adding new WANs without measurable disruption other than latency variation on the aggregation channel. <br>
<br>
  Most of the observations listed were observed with Speedify's log files (comprehensive) and network simulation tools.
</details>

Targets: Raspberry Pi 4 and Generic x86_64 (+VM)
Most modules were enabled, check config.info* for target specific info.
Use the discussions tab in Github for a forum-like discussion on networking configurations, and issues tab for SmoothWAN specifics.
Interactive discussion server: https://discord.gg/AxSSjpgwjx

Build status: Pre-fork feeds release

UI Screenshots:
![image](https://user-images.githubusercontent.com/96490382/147124839-fdbf295e-932a-4a6f-87a7-a322605579c9.png)
![image](https://user-images.githubusercontent.com/96490382/147124822-ce79e50c-09a5-43ac-8f35-3ddb8b2be882.png)
