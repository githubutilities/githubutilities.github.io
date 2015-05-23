---
layout: post
title:  "Personal Git Command Cheat Sheet"
date:   2015-01-22 17:10
categories: git
---

* [understanding git conceptually](http://www.sbf5.com/~cduan/technical/git/)

## Show Git Status

```sh
git status

git log

git show
```


## Update Your Local Repo

```sh
# ignore all local changes
git reset --hard
git pull

# keep all local changes
git stash
git pull
git stash pop
```


## Creating Multiple Pull Requests

```sh
# PR is based on branch, and is one-to-one relationship
# create multiple branches to isolate the PRs
git checkout -b <branch-name>
# do you jobs and commit
```


## Update Your fork

```sh
# Add a upstream repo
git remote add upstream <upstream-repo>
git fetch upstream
git checkout master

# Make a clean fork and also a clean commit
# It's always a good idea to fetch the upstream first
git fetch upstream
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

## Resolving conflicts

```sh
# bring up a GUI tool to resolve it
git mergetool
```

* [resolving a merge conflict guide from github](https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/)
* [fix merge conflicts in git from stackoverflow](http://stackoverflow.com/questions/161813/fix-merge-conflicts-in-git)

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

```sh
git clone -b branch-name remote-repo
```


## View Git remote URL

```sh
git remote -v
git remote show origin
```

## Branching

```sh
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
```

* [Git Branching Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)

## Update index with all changes

```sh
git add -A
```

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
# show file changes history
git log -p <filename>

# amending commit message
git commit --amend
git commit --amend -m "New commit message"

# editing commit history
git rebase -i HEAD~2
## this will show the last 2 commit changes made in a editor
## delete the commit you want to delete and save the changes
git push -f origin master
## push the changes with force to master branch

# go back commit
git log
git push origin +7f6d03:master
## or
git reset 7f6d03 --hard
git push -f origin master

# Revert the commit we just created
git revert HEAD

# Reset to most recent commit but keep all working directory changes
git reset
# Reset to most recent commit and overwrite all working directory changes
git reset --hard
```

* [automating script by vitorgalvao](https://github.com/vitorgalvao/tiny-scripts/blob/master/prfix)


## [Duplicating a repository](https://help.github.com/articles/duplicating-a-repository/)

```sh
$ git clone --mirror http://git.code.sf.net/p/catacombae/hfsexplorer
# Make a bare mirrored clone of the repository

$ cd hfsexplorer
$ git remote set-url --push origin https://github.com/githubutilities/hfsexplorer.git
# Set the push location to your mirror

$ git fetch -p origin
$ git push --mirror origin
```


## [Tagging Release](http://git-scm.com/book/en/v2/Git-Basics-Tagging)

```sh
# add a tag
git tag -a v0.1.0 -m 'version 0.1.0'

# delete a tag
git tag -d v1.0

# list all tags
git tag -l

# push
git push origin --tags
```


## [Git Post Hooks](http://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

* [Push-to-Deploy](http://krisjordan.com/essays/setting-up-push-to-deploy-with-git)


### Reference

* [Adding and Removing Tags on GitHub](http://wptheming.com/2011/04/add-remove-github-tags/)
* [Create GitHub releases via command line](http://www.barrykooij.com/create-github-releases-via-command-line/)
* [Creating a branch or tag in Git](https://www.drupal.org/node/1066342)

## [Git Reset Tutor](https://www.atlassian.com/zh/git/tutorial/undoing-changes#!reset)
## [Setup git in vps]({% post_url 2015-01-21-git-server-on-vps %})
## [Git Cheat Sheet by Github Education](https://education.github.com/git-cheat-sheet-education.pdf)
