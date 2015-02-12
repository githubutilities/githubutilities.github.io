---
layout: post
title:  "Unix-like System Package Mangement"
date:   2015-02-04 15:00
categories: apt,yum
---

# Compile

```sh
./configure --prefix=/your/absolute/install/directory
```

# Debian [link](https://help.ubuntu.com/community/AptGet/Howto)

```sh
apt-get update
apt-cache search <keyword>
apt-get install <package-name>

# Also remove the unnecessary package dependencies
apt-get autoremove openjdk-7-jdk
```

# RedHat

```sh
yum search <keyword>
yum install <package-name>
```

# Homebrew

* Autoremove in `brew` [*link*](http://stackoverflow.com/questions/7323261/uninstall-remove-a-homebrew-package-including-all-its-dependencies)

    > `brew leaves` prints all packages that does not depend on other
    > So you can do a logical and on `brew leaves` and `brew deps FORMULA`
    > 
    > ```sh
    > brew rm FORMULA
    > brew rm $(join <(brew leaves) <(brew deps FORMULA))
    > ```
    > use `brew_clean` script also in [here](https://gist.github.com/cskeeters/10ff1295bca93808213d)
    >
    > ```sh
    > brew leaves > brew_packages
    > brew_clean brew_packages
    > ```
* get info about a package `brew info <package-name>`
* use `homebrew-brewdler` to manage your `homebrew`, run `brew brewdle dump` to backup your `homebrew`
