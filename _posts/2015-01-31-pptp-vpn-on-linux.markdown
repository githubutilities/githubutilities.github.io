---
layout: post
title:  "PPTP VPN on Linux"
date:   2015-01-31 00:33
categories: linux,redhat
---

## Test kernel `mppe` support

Most people want their tunnels encrypted. Check the version of your kernel; if it is below 2.6.15-rc1 then you do not have MPPE support. To check further, test like this:

```sh
modprobe ppp-compress-18 && echo ok
```


## Install `ppp` and `pptpd`

* `ppp` support multiple protocol including `tcp/ip`, the most common way to ensure this is by allowing `tcp/ip` data flow through your firewall.

```sh
# install `ppp`
yum install ppp
# or `ubuntu`
sudo apt-get install ppp

# install `pptpd`
rpm -i http://poptop.sourceforge.net/yum/stable/rhel6/pptp-release-current.noarch.rpm
yum -y install pptpd
# or in `ubuntu`
sudo apt-get install pptpd
```


## Config `pptpd` and `ppp`

* `/etc/pptpd.conf`
* `/etc/ppp/pptpd-options`
* `/etc/ppp/chap-secrets`

```sh
# Configure IP Address Range
# uncomment the following line in `/etc/pptpd.conf`
> localip 192.168.0.1
> remoteip 192.168.0.234-238,192.168.0.245

# here is the configuration without comment
egrep -v '^#.*' /etc/pptpd.conf  | egrep -v '^$'
> option /etc/ppp/options.pptpd
> debug
> logwtmp
> connections 6
> localip 192.168.0.1
> remoteip 192.168.0.234-238,192.168.0.245

# set the ms-dns server in `/etc/ppp/pptpd-options`
# the configuration of `ppp` is applied every time ppp connection is established
> ms-dns 8.8.8.8
> ms-dns 8.8.4.4

# Adding users to `/etc/ppp/chap-secrets`
# * for automatically ip allocation
echo "username  pptpd   password    *" >> /etc/ppp/chap-secrets
```

## Setup IP Forwarding

```sh
# change the following line in `/etc/sysctl.conf`
> net.ipv4.ip_forward=1

# reload the configuration to apply the changes
sysctl -p
```


## Routing using `iptable`

```sh
# list the nat setting
iptables -t nat --list

# list default rules
iptables --line-numbers -n -L

# delete record by line-number from above command
iptables -D INPUT 1

# change record by line-number
iptables -I INPUT your-line-number -j LOGGING

# flush all the nat setting
iptables -t nat --flush

# add routing record to iptables
# 192.168.0.0/24 is your local network configed in `etc/pptpd.conf`
# `eth1` is your destination internet card interface
# enabled outbound NAT to eth0
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE
# or in AWS, route it to the `eth0`'s `inet address`(run `ifconfig` to get it)
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j SNAT --to 172.16.4.6

# save `iptable` setting to `/etc/sysconfig/iptables`
# so changes will not be lost after restart
/etc/init.d/iptables save

# restart iptables for changes to take effects
/etc/init.d/iptables restart
```


## Config `pptpd` and `iptables` to start at startup

```sh
# start `pptpd` and `iptables` at startup
chkconfig pptpd on
chkconfig iptables on

# start and stop services
service iptables restart
/etc/init.d/pptpd restart
```


## Troubleshooting

1. ensure `ppp` connection is OK which involves `firewall settings`(e.g. enable `TCP/IP` data flow) and `/etc/ppp/chap-secrets`, to test:
    - run `ifconfig` to see whether there is a `ppp` interface there
2. ensure `ip_forward` is OK which depends on the configuration of `iptables` and `sysctl config`, to test:
    - `ping` a public IP to see whether it is OK, e.g.
        + you can `ping` github public IP, `ping 192.30.252.131`
3. ensure `dns` is OK which involves `/etc/ppp/pptpd-options`'s `ms-dns` config, to test:
    - `ping github.com`

# `yum info installed`

> list installed package in redhat-like system

# iptables debugging
```sh
# log all drop packet(both incoming and outgoing)
iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A OUTPUT -j LOGGING
iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "[IPTables-Dropped]: " --log-level 7

# log specific packet
iptables -A INPUT -s 192.168.0.0/24 -j LOG --log-prefix='[your-debug-prefix] '
```

> `iptables -A LOGGING -j DROP` may freeze your system

> Visit [here](http://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/) for more info about `iptable`

# Linux logging and log redirecting

`tail -f /var/log/dmesg`

> Print the debug message.
> Red Hat family distributions (including CentOS and Fedora) use `/var/log/messages` and `/var/log/secure` where Debian-family distributions use `/var/log/syslog` and `/var/log/auth.log`.

> If (as with the default rsyslog configuration under CentOS 6.x) nothing is logged, you will need to configure rsyslog appropriately. We specified a --log-level of 7 – which is the debug syslog log level. So we need to configure rsyslog to send messages from the kern facility at log level 7 to somewhere useful.

```sh
vim /etc/rsyslog.conf
> ...
> kern.debug                        /var/log/firewall.log
> ...
service rsyslog restart

vim /etc/logrotate.d/syslog
# add /var/log/firewall.log to list of filenames
```


> It turns out that many modern Linux distributions come with 'rsyslog', which is a replacement for 'syslogd' or 'sysklogd', but starting with version 5.7.1 of rsyslog, a feature known as rate-limiting was added to the utility, and if a given process ID (PID) were to send more than 200 messages to /var/log/messages in a 5 second interval (the default setting in rsyslog), it will start to drop messages and place the following warning inside of /var/log/messages:

```
Jan 31 14:20:04 instance rsyslogd-2177: imuxsock begins to drop messages from pid 2260 due to rate-limiting
```

> quick fix

```sh
echo "\$SystemLogRateLimitInterval 2" >> /etc/rsyslog.conf
echo "\$SystemLogRateLimitBurst 500" >> /etc/rsyslog.conf

# or append this to `/etc/rsyslog.conf`
# This means in plain words, that rate limiting will take effect if more than 500 messages occur in 2 seconds.
$SystemLogRateLimitInterval 2
$SystemLogRateLimitBurst 500

# apply the changes
/etc/init.d/rsyslog restart
```

> Visit [here](https://www.digitalocean.com/community/tutorials/how-to-view-and-configure-linux-logs-on-ubuntu-and-centos) for more info about linux logs

## Reference
* [how to install pptp vpn server on centos 6.x](http://drewsymo.com/2013/11/how-to-install-pptp-vpn-server-on-centos-6-x/)
* [pptp vpn server on ubuntu](https://www.evernote.com/shard/s411/sh/cdcfeedf-1a7d-49a1-97ba-ffb5ae176e70/014c859d05ee5df4c3d2dfc5c8fa52ac)

