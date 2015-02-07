---
layout: post
title:  "Mac OS X Filesystem Support"
date:   2015-02-04 16:50
categories: apt,yum
---

# [Write in NTFS](http://apple.stackexchange.com/questions/106589/write-in-ntfs-using-mavericks)

```sh
brew install osxfuse
brew install ntfs-3g
sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
```