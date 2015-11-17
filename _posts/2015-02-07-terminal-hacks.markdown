---
layout: post
title:  "Terminal Hacks"
date:   2015-02-07 10:42
categories: terminal command
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


# String Editing

```sh
# using awk
ls -l | awk '{print $9}'
```


# Mac OS X restarting services

```sh
# Fixed Finder crashes
killall -KILL Finder
# or option (=alt) + rightclicking the Finder icon in the Dock and selecting Relaunch

# Fixed Dock or Spaces crashes
killall -KILL Dock

# Fixed Menubar crashes
killall -KILL SystemUIServer
```


# Convert `plist` file to xml

```sh
# `com.apple.sidebarlists.plist` is originally stored as binary format
cp ~/Library/Preferences/com.apple.sidebarlists.plist <your-folder>
plutil -convert xml1 com.apple.sidebarlists.plist

# convert XML .plist to binary
plutil -convert binary1 <your-xml-plist-file>
```


# reference

* [setup os x development](http://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-1-core-files-and-custom-shell)
* [10 useful terminal hacks on os x](http://www.mitchchn.me/2014/os-x-terminal/)
* [Mac OS X dock finder spaces or menubar crashes](http://www.thxbye.de/mac/mac-restarting-the-mac-os-x-dock-finder-spaces-or-menubar.html)