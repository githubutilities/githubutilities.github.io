---
layout: post
title:  "Hack Android Phone And Dump Internal Memory"
date:   2015-01-30 12:25
categories: linux,android,busybox,root
---

## Root the phone

### Successful Attempt

* 360root[http://root.360.cn]

### Unsuccessful Attempt

* ~~kingroot by tencent~~
* ~~z4root~~
* ~~Universal Android Root | Kingo Android Root~~

## dump the data using `netcat`

{% highlight sh %}
adb forward tcp:5555 tcp:5555
adb shell
/system/bin/busybox nc -l -p 5555 -e /system/bin/busybox dd if=/dev/block/mmcblk0p12

adb forward tcp:5555 tcp:5555
cd /nexus
nc 127.0.0.1 5555 | pv -i 0.5 > mmcblk0p12.raw
{% endhighlight %}

## Reference
* [xda developers forum](http://forum.xda-developers.com/galaxy-nexus/general/guide-internal-memory-data-recovery-yes-t1994705)