---
title: "using Jekyll on tilde.town, circa 7th July 2020"
layout: post
---

Running the following command on the command line:

jekyll -v

resulted in the following message:

> -bash: /usr/local/bin/jekyll: /usr/bin/ruby2.5: bad interpreter: No such file or directory

After some research, I found that I could run the following command:

/usr/bin/jekyll -v

which resulted in the following message:

> jekyll 3.8.6

I hope this post saves someone else some time.

---

Besides the above, I also made changes to my .bashrc , before Jekyll could work.

If you find it helpful, you may add the following two lines to your file located
at ~/.bashrc :

export GEM_HOME=/home/your_username/gems

export PATH="/home/your_username/gems:$PATH"

Replace your_username (in the above two lines) with your user-name, of course.
