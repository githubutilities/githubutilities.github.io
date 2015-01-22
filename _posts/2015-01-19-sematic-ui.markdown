---
layout: post
title:  "Sematic UI pitfalls"
date:   2015-01-19 12:46
categories: sematic ui
---

here is the code snippet in `sematic.css`

{% highlight css %}
@import 'https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic&subset=latin';
{% endhighlight %}

> `sematic.css` import font using google online api which may cause trouble due to the network connectivity.