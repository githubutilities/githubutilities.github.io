---
layout: post
title:  "curl cheatsheet"
date:   2015-11-17 15:39
categories: curl http
---


# cURL command brief examples

```sh
# download and output to standard output
curl http://www.google.com

# -L: follow redirections (specified in HTTP Location Headers)
curl -L http://www.google.com

# -o <filename>: output to specific file
curl -L -o out.html http://www.google.com

# -O: output to filename based on url
curl -O http://cs229.stanford.edu/notes/cs229-notes1.pdf

# output to multiple file
curl -O <your-url> -O <your-another-url>

# -#: display progress bar while downloading instead of progress meter
curl -# -O http://cs229.stanford.edu/notes/cs229-notes1.pdf

# -C -: resume previous download by submitting somethings like ``Range: bytes=61440-`` in HTTP request header
curl -# -C - -O http://cs229.stanford.edu/notes/cs229-notes1.pdf

# --limit-rate <rate>: limit data transfer rate
curl --limit-rate 1000B -O http://www.gnu.org/software/gettext/manual/gettext.html

# -z <date(time)>: download only modified before/after specific time
curl -z -29-Sep-2012 -# -O http://cs229.stanford.edu/notes/cs229-notes1.pdf
# this will download only if modified before 29-Sep-2012

# download list of url
curl -C - -# -O http://cs229.stanford.edu/notes/cs229-notes[1-9].pdf

# -v, –trace: debug using verbose to inspect header
curl -v http://www.google.com

# -I/--head: fetch HTTP-header only
curl -I http://www.google.com

# custom protocol
curl dict://dict.org/show:db
curl dict://dict.org/d:google:foldoc

# -x <host>:<port>: using proxy
curl -x localhost:8000 http://www.google.com
```

> NOTE: `curl` can also be used to 
> * HTTP authentication
> * upload files to FTP, `--upload-file` or `-T`
> * send mail
>
> refer [here](http://www.thegeekstuff.com/2012/04/curl-examples/) for detail.
