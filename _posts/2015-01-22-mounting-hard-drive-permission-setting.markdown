---
layout: post
title:  "Mount Hard Drive Permission Setting"
date:   2015-01-22 10:30
categories: Linux, mount
---

## Edit `/etc/fstab`, e.g.

```
/dev/xvdb1      /home/git/data      ext4    defaults    0 0
```

> ext4 file system does not support `uid`, `gid` and `umask`(which are very useful for FAT file system) options

## Mount the hard drive

simple run `mount -a`

## Change the disk owner

simply change the owner of the drive which will be remember by the file system after remount

```sh
chown -R username mount-point
```

> You can also change the permission using `chmod` and `chgrp` for owner group (use `usermod` for group editing)