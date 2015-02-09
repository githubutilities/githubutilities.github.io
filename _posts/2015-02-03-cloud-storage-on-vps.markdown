---
layout: post
title:  "Cloud Storage On VPS"
date:   2015-02-03 21:22
categories: ssh,ftp,sftp,rsync
---

# Use `sshfs` to remotely mount


# Uni-directional mirroring `rsync` or `unison`

* use `ssh` by default
* support incremental copy
* on-line compression

```sh
# use like a distributed version control
rsync -urltv --delete -e ssh src.dir othermachine:/destination.src.dir

# `rsync` to local by default
rsync --compress-level=9 -av username@hostname:path/to/folder
# or use
rsync --compress-level=9 -av username@hostname:path/to/folder path/to/local/folder
```

> * `--compress-level` use to manually specify compress level or you can use `-z` to use the default level
> * `-a` archive. Keep file timestamps in intact and only copy modified files
> * `-v` verbose.


# Setup `samba` for remote file sharing

```sh
# install `samba`
yum install samba samba-client samba-common
sudo apt-get install samba

# start `samba` at boot time if you like
chkconfig smb on
chkconfig nmb on

# backup your config file
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# create a user for smb
useradd smbuser
groupadd smbgrp
usermod -a -G smbgrp smbuser
smbpasswd -a smbuser

# change permission of your folder
chown -R smbuser:smbgrp path/to/folder/
chmod -R 0770 path/to/folder/

# test your configuration
testparm

# restart services
service smb restart
service nmb restart
```

reference

* [ubuntu](https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20(Command-line%20interface/Linux%20Terminal)%20-%20Uncomplicated,%20Simple%20and%20Brief%20Way!)
* [lintut](http://lintut.com/easy-samba-server-installation-on-centos-6-5/)


# FTP

```sh
# install `vsftpd` with any method
yum install vsftpd
apt-get install vsftpd

# if you enable anonymous user login, the `pub` directory is in `/var/pub`
> anonymous_enable=YES
> local_enable=YES

# restart service
/etc/init.d/vsftpd restart
```

reference

* [ubuntu](https://help.ubuntu.com/community/vsftpd)
* [digitalocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-on-centos-6--2)
* [binarytides](http://www.binarytides.com/vsftpd-configure-ssl-ftps/)