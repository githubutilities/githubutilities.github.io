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