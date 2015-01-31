---
layout: post
title:  "Ruby Package Manager"
date:   2015-01-31 19:09
categories: ruby,mac,osx
---

# Gem and Bundler are different package manager and has different package under its folder
`jekyll build` use Gem package
`bundle exec jekyll build` use Bundler package

# The file "/usr/include/iconv.h" is missing in your build environment, when install `nokogiri`

* In OSX 10.9+, you may need to run `xcode-select --install` to install xCode command tools to allow you to install libiconv.
* if you want the newest version, go through the following steps
* install a newer version of libiconv by `brew install libiconv`
* then link your new iconv libs using `brew link libiconv`
* then install your gem using `gem install nokogiri -- --with-iconv-dir=/usr/local/Cellar/libiconv/1.14`