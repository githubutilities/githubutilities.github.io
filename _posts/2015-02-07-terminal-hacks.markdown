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