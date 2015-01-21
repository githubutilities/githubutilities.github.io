---
layout: post
title:  "Git Server on VPS"
date:   2015-01-21 21:30:00
categories: git
---

# How to setup a private git server on VPS

1. run `useradd git` and `passwd git` to add a user account to remote server
2. `git init --bare project-name.git` as `git` user
3. on the local mechine, run `git init && git remote add origin git@example.com:project-name.git`

### Reference
1. digitalocean[^more_info]
2. [ams at toroid][toroid]

[^more_info]: [digitalocean]
[digitalocean]: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-git-server-on-a-vps
[toroid]: http://toroid.org/ams/git-website-howto