---
layout: post
title:  "Remote Control"
date:   2015-02-24 22:57
categories: remote,router
---

# Dynamic DNS(DDNS)

**Map static domain name to dynamic IP address.** Most of the internet providers does not provide us with static IP address, and instead, they probably use `PPPoE` with DHCP. Thus, we get dynamic but unique IP address. In order to connect to our own servers, we can use `DDNS` service provider to bind our dynamic IP address to a static DNS URL.

Here are some `DDNS` service providers:

* oray.com
* 3322.org
* dyndns.com
* no-ip.com


# Port forwarding && DMZ

* `Port Forwarding` can map IP address of our subnet to specific port of our public IP. **Map subnet address to specific port of wireless router.**
* According to [wikipedia](http://en.wikipedia.org/wiki/DMZ_(computing)), a DMZ or demilitarized zone (sometimes referred to as a perimeter network) is a physical or logical subnetwork that contains and exposes an organization's external-facing services to a larger and untrusted network, usually the Internet. **It can map a subnet device to a gateway wireless router and act as a public network interface.**


# Virtual Network Computing(VNC)

According to [wikipedia](http://en.wikipedia.org/wiki/Virtual_Network_Computing), Virtual Network Computing (VNC) is a graphical desktop sharing system that uses the Remote Frame Buffer protocol (RFB) to remotely control another computer.

**NOTICE**: **most commonly use desktop as server.** only use computer as server and use mobile or computer as client.

Some application on VNC:

* [teamviewer](http://www.teamviewer.com/)
* GPL app -- [tightvnc](http://www.tightvnc.com/)
* [realvnc](https://www.realvnc.com/)


# Remote Surveillance

checkout `tinyCam Monitor` in android.


# Remote administration software(RAT)

According to [wikipedia](http://en.m.wikipedia.org/wiki/Remote_administration_software), A remote administration tool (a RAT) is a piece of software that allows a remote "operator" to control a system as if he has physical access to that system.

* airdroid
* [Monitordroid](http://forum.xda-developers.com/android/apps-games/app-monitordroid-remote-administration-t2849817)