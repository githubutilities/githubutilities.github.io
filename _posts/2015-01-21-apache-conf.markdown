---
layout: post
title:  "Apache Configuration"
date:   2015-01-21 16:29:00
categories: apache
---

Conflict between `httpd.conf` `httpd-vhosts.conf`

{% highlight sh %}
DocumentRoot "/var/www"

# Virtual hosts
#Include conf/extra/httpd-vhosts.conf
{% endhighlight %}

> include `httpd-vhosts.conf` in `httpd.conf` may conflict with whatever DocumentRoot specified in 