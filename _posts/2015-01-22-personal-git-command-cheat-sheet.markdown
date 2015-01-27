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

## Commit

{% highlight sh %}
# amending commit message
git commit --amend
git commit --amend -m "New commit message"

# editing commit history
git rebase -i HEAD~2
## this will show the last 2 commit changes made in a editor
## delete the commit you want to delete and save the changes
git push -f origin master
## push the changes with force to master branch
{% endhighlight %}

## [Setup git in vps]({% post_url 2015-01-21-git-server-on-vps %})

