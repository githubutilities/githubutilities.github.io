---
layout: post
title:  "Terminal Hacks"
date:   2015-02-07 10:42
categories: terminal,command
---

# Make a beep sound when finished

```sh
# make a beep, in OS X badge will show if terminal not in foreground
tput bel
# or 
echo -e "\a"

ping -c 5 google.com && tput bel
```

# Dirty StopWatch

```sh
# Use `ctrl-c` to stop
time cat

# Use `ctrl-d` to stop
time read
```

# Copy and Paste in terminal

```sh
echo "hi" | pbcopy
pbcopy < file.txt

pbpaste
```

> For linux user who want `pbcopy` or `pbpaste`, please refer to [osxs pbcopy for linux on superuser.com](http://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux)

# Remove images metadata to protect privacy

```sh
exiftool -all= *.jpg
```

# Bash Keyboard Shortcut

please refer to [ss64](http://ss64.com/osx/syntax-bashkeyboard.html)


# List open port

```sh
# For Mac OSX, you can use `lsof`
lsof -i:8080
# For Linux you may use `netstat`
```


reference

* [setup os x development](http://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-1-core-files-and-custom-shell)
* [10 useful terminal hacks on os x](http://www.mitchchn.me/2014/os-x-terminal/)