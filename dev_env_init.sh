# this script start a new shell and run the follow command


# start `jekyll serve` in background
# mute the stdout
jekyll serve > /dev/null &

# start `jekyll build --watch` in foreground
jekyll build --watch