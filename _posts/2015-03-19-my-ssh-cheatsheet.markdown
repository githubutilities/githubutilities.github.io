---
layout: post
title:  "My SSH Cheatsheet"
date:   2015-03-19 10:29
categories: ssh
---

# Enter SSH passphrase only once

```sh
$ ssh-add /home/username/.ssh/id_rsa
```

> Use absolute path instead of relative path to avoid re-adding key after reboot.


# SSH VPS without password

```sh
ssh-keygen -t rsa

scp id_rsa.pub username@server:~/.ssh/id_rsa.pub
> ssh username@server
> cd ~/.ssh
> cat id_rsa.pub >> authorized_keys
> exit

ssh username@server
```

# Reference

* [Multiple SSH Keys for Multiple Github Accounts](https://gist.github.com/githubutilities/0e5df6493b7d528f1e75)
* [askubuntu](http://askubuntu.com/questions/362280/enter-ssh-passphrase-once)
* [perminent add ssh key on stackoverflow](http://stackoverflow.com/questions/3466626/add-private-key-permanently-with-ssh-add-on-ubuntu)