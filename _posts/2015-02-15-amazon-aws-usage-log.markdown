---
layout: post
title:  "Amazon AWS Usage Log"
date:   2015-02-14 22:42
categories: aws,registration
---

# Entry one -- Registration Process

1. Set your email and password without email confirmation
2. Set your contact info which includes name, address and phone number

    > this info better base on your IP address location

3. Set your bank account card without its secure code which should have one dollar in it
4. Validate your phone number by the automated phone call system
5. Done and wait. 


# Entry two -- Edit Amazon EC2 Instance to Allow `ping` Request

By default, amazon does not allow `ping` request for security reason. You can change the `Security Groups` settings to enable it.

> I call it the amazon firewall, so cool isn't it.

1. Login AWS Management Console and go to EC2
2. Goto `NETWORK & SECURITY`--`Security Groups` on the left
3. Add a `Inbound` rule, select `Custom ICMP rule`, type:`echo request`, source from anywhere