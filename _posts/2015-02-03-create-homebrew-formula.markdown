---
layout: post
title:  "Create Homebrew Formula"
date:   2015-02-03 16:45
categories: homebrew brew
---

# Scaffolding
```sh
# Generate formula file in `(brew --repository)/Library/Formula/scalpel.rb`
brew create https://github.com/githubutilities/scalpel/archive/v2.0.0.tar.gz

# Edit the `scalpel.rb` file
```

# Here is the file
```
class Scalpel < Formula
  homepage "https://github.com/sleuthkit/scalpel"
  url "https://github.com/githubutilities/scalpel/archive/v2.0.0.tar.gz"
  sha1 "b4ae70208f15ae1bfa42e08df661cfaff38121ee"

  # depends_on "cmake" => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components

  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'libtool'
  depends_on 'tre'

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./bootstrap"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
    etc.install "scalpel.conf" => "scalpel.conf.sample"
  end
end
```

# Tools

* You can use the GitHub Release Feature for distributing the archive
* Some command line tools

```sh
# Use `openssl` to get the `sha1` checksum
openssl sha1 [full path to file]

# generate `sha256`
shasum -a 256 <your-file>

# List all `tap`s
brew tap

# Use the `telemachus/desc` tap to get some brief info about the package
brew tap telemachus/desc

# List a package dependencies
brew deps <package-name>

# List all package installed
brew list

# List all package dependencies
brew list | while read cask; do echo -n "$cask ->"; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
```


# Checking

remember to run `brew cask audit <your-cask>` or `brew audit <your-formula>` before committing your changes.


# Reference
* [Homebrew formula cookbook](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md#formula-cookbook)
* [GNU Autotools Tutor](https://www.lrde.epita.fr/~adl/dl/autotools.pdf)
* [Distribute using bintray](http://blog.bintray.com/2013/05/30/google-and-github-insist-go-store-your-binaries-in-a-proper-place/)
* [bintray](https://bintray.com)