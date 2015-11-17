---
layout: post
title:  "Vulnerable Attack"
date:   2015-01-30 20:35
categories: linux glibc
---

## glibc vulnerability([CVE-2015-0235](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0235))

* `gethostbyname()` buffer overflow attach, run the following code to test whether the system is vulnerable

```c
/* ghosttest.c:  GHOST vulnerability tester */
/* Credit: http://www.openwall.com/lists/oss-security/2015/01/27/9 */
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
 
#define CANARY "in_the_coal_mine"
 
struct {
  char buffer[1024];
  char canary[sizeof(CANARY)];
} temp = { "buffer", CANARY };
 
int main(void) {
  struct hostent resbuf;
  struct hostent *result;
  int herrno;
  int retval;
 
  /*** strlen (name) = size_needed - sizeof (*host_addr) - sizeof (*h_addr_ptrs) - 1; ***/
  size_t len = sizeof(temp.buffer) - 16*sizeof(unsigned char) - 2*sizeof(char *) - 1;
  char name[sizeof(temp.buffer)];
  memset(name, '0', len);
  name[len] = '\0';
 
  retval = gethostbyname_r(name, &resbuf, temp.buffer, sizeof(temp.buffer), &result, &herrno);
 
  if (strcmp(temp.canary, CANARY) != 0) {
    puts("vulnerable");
    exit(EXIT_SUCCESS);
  }
  if (retval == ERANGE) {
    puts("not vulnerable");
    exit(EXIT_SUCCESS);
  }
  puts("should not happen");
  exit(EXIT_FAILURE);
}
```

> if you got `vulnerable` output, run the following command

```sh
# debian-like system
apt-get update
apt-get install libc6
# redhat-like system
yum update glibc
```

> run `lsof | grep libc | awk '{print $1}' | sort | uniq` to get the packages dependencies

### Reference
1. [BUGTRAQ:20150127 Qualys Security Advisory CVE-2015-0235 - GHOST: glibc gethostbyname buffer overflow][seclists-274]
2. [BUGTRAQ:20150127 GHOST gethostbyname() heap overflow in glibc (CVE-2015-0235)][seclists-269]
3. [patch by cyberciti][cyberciti-patch-ghost]

[seclists-269]: http://seclists.org/oss-sec/2015/q1/269
[seclists-274]: http://seclists.org/oss-sec/2015/q1/274
[cyberciti-patch-ghost]: http://www.cyberciti.biz/faq/cve-2015-0235-patch-ghost-on-debian-ubuntu-fedora-centos-rhel-linux/
