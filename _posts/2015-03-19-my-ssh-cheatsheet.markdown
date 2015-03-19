---
layout: post
title:  "my ssh cheatsheet"
date:   2015-03-19 10:29
categories: router
---

# Enter SSH passphrase only once

```sh
$ ssh-add /home/username/.ssh/id_rsa
```

> Use absolute path instead of relative path to avoid re-adding key after reboot.

# Reference

* [Multiple SSH Keys for Multiple Github Accounts](https://gist.github.com/githubutilities/0e5df6493b7d528f1e75)
* [askubuntu](http://askubuntu.com/questions/362280/enter-ssh-passphrase-once)