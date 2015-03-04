---
layout: post
title:  "Exploring Router"
date:   2015-03-04 19:58
categories: router
---

# Tools and Notes

* [maintaining your NIC(network interface card) for mac](http://www.ehow.com/how_8781864_disable-enable-nic-mac.html)
* [some router backdoor](http://lcx.cc/?i=3127)
* [some sample](http://www.right.com.cn/forum/forum.php?mod=viewthread&tid=130631)
* `WR` in `TL-WR845N` stands for `wide router` which indicates broadband


# Hacking using `aircrack-ng`

I tried `airmon-ng` and got this error `Wireless tools not found`.

reference

* [aircrack tutor](http://www.aircrack-ng.org/doku.php?id=tutorial)


# Router ROM

maybe hardware dependent

* dd-wrt
    > popular, commercial use

* tomato
    > many distributions, more hacks required, no commercial use

* openwrt
    > more hardware hacks, expert required

* m0n0wall
    > `Pfsense` OS can turn your PC into a router

* vyatta
    > `x86` specific

reference

* [pconline review](http://itbbs.pconline.com.cn/network/16520618.html)


# Router OS detection

use `nmap` to scan open ports and OS detection, and I discover that `TP-WR340G+` is using `Wind River VxWorks`.

```sh
# `-O` for OS detection
sudo nmap -O 192.168.1.1
```

reference

* [nmap command examples by cyberciti](http://www.cyberciti.biz/networking/nmap-command-examples-tutorials/)
* [VxWorks vulnerabilities by ics-cert](https://ics-cert.us-cert.gov/advisories/ICSA-13-091-01)
* [VxWorks vulnerabilities by rapid7](https://community.rapid7.com/community/metasploit/blog/2010/08/02/shiny-old-vxworks-vulnerabilities)


# Router UPnP

Universal Plug and Play (UPnP) is for automatic discovery of other UPnP devices on the network. It says UPnP can speedup internet speed for bit torrent download.

```sh
# install `miniupnpc` package
brew install miniupnpc

# list UPnP redirections
upnpc -l

# add port redirections
upnpc -a 192.168.31.2 22 22 TCP
```

referece

* [upnp on xiaomi router](http://bbs.xiaomi.cn/thread-9744865-1-1.html)