---
layout: post
title:  "Wireless Router Config Log"
date:   2015-02-08 14:42
categories: wireless,router
---

# Wireless Distribution System(WDS)

Without wired connection, WDS bridging and repeating is a way of enabling interconnection of access points which means increasing AP numbers and covered area in an IEEE 802.11 network. 

* **Wireless Bridging**: WDS APs communicate only with each other and don’t allow wireless clients or Stations (STA) to access them.
* **Wireless Repeating**: APs communicate with each other and with wireless STAs
* **Disadvantages**:
    - Wireless throughput is cut in half, i.e.
        + more data flow between APs
        + all transmissions using same channel need retransmitted to wired LAN
    - Dynamically assigned and rotated encryption keys are not supported in a WDS connection. 
        + **Static WEP keys** only may be used in a WDS connection, including any STAs that associate to a WDS repeating AP.
    - WDS Interoperability needs to be considered between different products

Here is a sample to config WDS repeating:

1. config the WDS hop's IP in the same network range
    > It is better to use the static IP method

2. disable the DHCP function of WDS hop
3. config the SSID and BSSID, restart and done!
4. if not working, try config router channel to use same channel
    > I succeeded config WDS without configuring the router to use the same channel

Reference

* [how to wds bridge](http://www.tomsguide.com/us/how-to-wds-bridge,review-253.html)
* [TP-LINK WDSed with Xiaomi Router](http://bbs.xiaomi.cn/thread-9999187-1-1.html)


# ISSUE: Can not Connect to Wireless Router

Try restart the router. If this works, try schedule the restart process.
