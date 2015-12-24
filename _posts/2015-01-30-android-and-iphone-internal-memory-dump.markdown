---
layout: post
title:  "Root Android Phone and Dump Mobile Phone Internal Memory"
date:   2015-01-30 12:25
categories: linux android busybox root iphone netcat
---

## Root the phone

### Successful Attempt

* [360root](http://root.360.cn)

### Unsuccessful Attempt

* ~~kingroot by tencent~~
* ~~z4root~~
* ~~Universal Android Root | Kingo Android Root~~

## Android - dump the data using `netcat`

```sh
adb forward tcp:5555 tcp:5555
adb shell
/system/bin/busybox nc -l -p 5555 -e /system/bin/busybox dd if=/dev/block/mmcblk0p12

adb forward tcp:5555 tcp:5555
cd /nexus
nc 127.0.0.1 5555 | pv -i 0.5 > mmcblk0p12.raw
```

## iPhone - dump raw disk using `netcat`

```sh
# in iPhone's bash, run
netcat -e "dd bs=4096KB if=/dev/rdisk0s1s2" -l -p 5555

# mac specific
brew install pv
# connect to same Wi-Fi, and run the following in Terminal
# NOTE: 192.168.1.108 is your iPhone's IP
nc 192.168.1.108 5555 | pv -i 0.5 > iphone.raw 
```

> NOTE: `/dev/disk0` is a block device while `/dev/rdisk0` is a character device. You can't choose a block device to dump. 
> 
> Other solution can be found [here](http://www.cgsecurity.org/wiki/Recover_data_from_an_iPhone) using `ssh`(`dd if=/dev/rdisk0 bs=4096 | ssh -C username@computer_IP 'dd of=iphone.img'`) instead of `netcat`.
> 
> IMPORTANT: Because data stored in iDevice is encrypted since iPhone 3GS and later(refer [here](https://support.apple.com/en-us/HT202064)), it may need to brute-force the encryption key(e.g. AES).

* [iPad2 data recovery](http://outergalactic.org/blog/no-love-for-ipad2-data-recovery/)
* [some iPhone data protection stuff for data forensic purpose](https://code.google.com/p/iphone-dataprotection/)
* [overcoming iOS Data protection to re-enable iPhone forensics](https://media.blackhat.com/bh-us-11/Belenko/BH_US_11_Belenko_iOS_Forensics_Slides.pdf)
* [extracting aes keys from iPhone](http://www.securitylearn.net/2012/04/22/extracting-aes-keys-from-iphone/)
* [decrypt iPhone dd image](http://security.stackexchange.com/questions/100179/decrypt-iphone-dd-image)
* [breaks iPhone encryption](http://blog.elcomsoft.com/2011/05/elcomsoft-breaks-iphone-encryption-offers-forensic-access-to-file-system-dumps/)


## Reference
* [xda developers forum](http://forum.xda-developers.com/galaxy-nexus/general/guide-internal-memory-data-recovery-yes-t1994705)
