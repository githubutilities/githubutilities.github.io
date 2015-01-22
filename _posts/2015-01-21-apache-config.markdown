---
layout: post
title:  "Apache Configuration"
date:   2015-01-21 16:29
categories: apache
---

### Query apache config file path

* run `apachectl -V | grep SERVER_CONFIG_FILE` to get the config file relative path
* run `apachectl -V | grep HTTPD_ROOT` to get the `httpd` bin path

### Conflict between `httpd.conf` and `httpd-vhosts.conf`

Including `httpd-vhosts.conf` in `httpd.conf` may conflict with whatever DocumentRoot specified, it's best to comment include script at first.

{% highlight sh linenos%}
DocumentRoot "/var/www"

# Virtual hosts
#Include conf/extra/httpd-vhosts.conf
{% endhighlight %}

