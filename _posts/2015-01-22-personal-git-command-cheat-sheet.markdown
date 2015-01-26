---
layout: post
title:  "Personal Git Command Cheat Sheet"
date:   2015-01-22 17:10
categories: git
---

## Clone specific branch

{% highlight sh %}
git clone -b branch-name remote-repo
{% endhighlight %}

## Update local repository

{% highlight sh %}
git pull
{% endhighlight %}

## View Git remote URL

{% highlight sh %}
git remote -v
git remote show origin
{% endhighlight %}

## Branching

{% highlight sh %}
# create new branch
git branch branch-name

# show all branches
git branch -a

# show all remote branches
git branch -r

# switch between branches
git checkout branch-name
{% endhighlight %}

## Update index with all changes

{% highlight sh %}
git add -A
{% endhighlight %}

## Amending commit message

{% highlight sh %}
git commit --amend
git commit --amend -m "New commit message"
{% endhighlight %}

## [Setup git in vps]({% post_url 2015-01-21-git-server-on-vps %})

