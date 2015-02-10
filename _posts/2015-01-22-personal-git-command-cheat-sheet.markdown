---
layout: post
title:  "Personal Git Command Cheat Sheet"
date:   2015-01-22 17:10
categories: git
---

## Show Git Status

```sh
git status

git log

git show
```

## Update Your fork

```sh
# Add a upstream repo
git remote add upstream <upstream-repo>
git fetch upstream
git checkout master

# Make a clean fork and also a clean commit
# The `--rebase` option places your changes on top of the latest commit without merges.
# `git pull` is fetch + merge
git pull --rebase upstream master

# Merge your commits into one
# Undo all your commits with your file changes untouched
git reset --soft upstream/master
# Commit your single changes
git commit -a
# Check your changes, use `gitx` in Mac OS X or `gitk` in linux
git diff <branch 1> <branch 2>

#git fetch upstream
#git checkout master
###git merge upstream/master master
# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:
#git rebase upstream/master
```

## Fix `.gitignore` not working

```sh
git rm -r --cached .
git add .
git commit -m ".gitignore is now working"

# Or you can remove specific file like finder cache
git rm --cached .DS_Store
# then commit you changes
```

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
# show current branch
git branch

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

## Stash

``` sh
# stash the changes
git stash

# list the stash
git stash list

# pop the top stash
git stash pop
```

## Commit

* to add a feature
* to remove a bug
* to refactor the source code

```sh
# amending commit message
git commit --amend
git commit --amend -m "New commit message"

# editing commit history
git rebase -i HEAD~2
## this will show the last 2 commit changes made in a editor
## delete the commit you want to delete and save the changes
git push -f origin master
## push the changes with force to master branch

# Revert the commit we just created
git revert HEAD

# Reset to most recent commit but keep all working directory changes
git reset
# Reset to most recent commit and overwrite all working directory changes
git reset --hard
```

## [Git Reset Tutor](https://www.atlassian.com/zh/git/tutorial/undoing-changes#!reset)
## [Setup git in vps]({% post_url 2015-01-21-git-server-on-vps %})
## [Git Cheat Sheet by Github Education](https://education.github.com/git-cheat-sheet-education.pdf)
