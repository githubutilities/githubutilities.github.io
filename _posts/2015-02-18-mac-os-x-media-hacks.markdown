---
layout: post
title:  "Mac OS X Media Hacks"
date:   2015-02-18 16:31
categories: mac,osx,media,hack
---

# Airplay

As one of the most important features of osx, airplay is a important hack for media playing.

**reference**

* [wireless display](http://www.tomsguide.com/us/how-to-stream-to-tv,news-18335.html)
* [Unofficial AirPlay Protocol Specification](http://nto.github.io/AirPlay.html)
* [stackexchange airplay across vlans](http://networkengineering.stackexchange.com/questions/5954/what-exactly-is-required-to-make-airplay-work-across-vlans)
* [audio MIDI setup](http://apple.stackexchange.com/questions/143317/change-source-in-audio-midi-setup-via-command-line)
* [mac airplay tools](http://computers.tutsplus.com/tutorials/5-ways-to-airplay-from-your-mac-to-your-television--mac-52157)

# Airplay Audio

* GENERAL WAYS -- Mirroring. Go to `System Preference` > `Sound` > `Output` tab to select the output audio channel.
OR you can hold down `Option` key on your keyboard, then click on the speaker icon in your menu bar.
* Use `iTunes`.

# Airplay video

* GENERAL WAYS -- Mirroring. Go to `System Preference` > `Displays` to select the output video channel.
* Use `iTunes`.
* Use `iTools` for mirroring in laptop or desktop.

# Audio

1. Dictation in command line. You can change the language pack in `System Preference` > `Dictation & Speech` > `Text to Speech` tab > `System Voice` > `Customize`

```sh
say -a "AirPlay" <your-words>;say -r160 -a "Built-in Output" <your-words>
```
2. Play audio file in command line. 

```sh
# this using mac osx default `afplay` to play audio file to default audio output
afplay file.mp3
```