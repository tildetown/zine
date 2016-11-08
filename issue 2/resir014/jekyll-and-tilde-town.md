```
category: blog
layout: post
title: "Jekyll and tilde.town"
```

# Jekyll and tilde.town

12 Aug 2016

For someone who wants to get a simple blog up and running but thinks that installing WordPress aren't worth the hassle, [Jekyll][jekyll] is *the* go-to solution for generating a static page on the fly. You can simply install it, look through many of the themes available out there (or use the default), then write your content in Markdown, Textile, or HTML, and you have yourself a statically generated website!

Jekyll is by far my favourite static-site generator, and I use it to generate my tilde page. You can even use it to quickly generate your own tilde page, too. I think a lot of townies will find this very useful, so here's a quick guide for everyone to get started with creating your first ever Jekyll site on tilde.town.

Alright, let's login to our server and get started!

---

## Setting up Ruby

To get started with Jekyll, we will need to have Ruby up and running. The version of Ruby installed by default on the server is outdated, however we can use the newer version of Ruby located in the `/opt/puppetlabs/puppet/bin` directory. We will also change the location of our gem install to ensure that we don't need to `sudo` every time we install Rubygems.

First, run `ruby -v` and make note of the current version of Ruby installed on the system.

Then, open `~/.bashrc` with your favourite text editor, and add the following to the end of the file:

```bash
# use the puppetlabs binary collection
PATH="/opt/puppetlabs/puppet/bin:$PATH"

# use local rubygems
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# set rubygem paths
export GEM_HOME="$(ruby -rubygems -e 'puts Gem.user_dir')"
export GEM_PATH="$(ruby -rubygems -e 'puts Gem.user_dir')"
```

You will need to restart your bash session at this point.

To test that the new `~/.bashrc` is loaded correctly, run `ruby -v` from the command line and see if the version number is higher than what was installed on the system.

## Installing Jekyll

Now what we have Ruby properly configured, let's install Jekyll!

```bash
$ gem install bundler jekyll
```

Run `jekyll -v` to make sure it's properly installed.

## Setting up your Jekyll site

You can use the default Jekyll theme by issuing the `jekyll new <directory>` command (the `<directory>` part being the place where you want to place the generated theme in the system), but for easier setup, let's use the [Poole][poole] theme, my favourite go-to theme for quickly setting up a Jekyll site.

First, download the theme zip file and extract it.

```bash
$ wget https://github.com/poole/poole/archive/v2.0.0.zip && unzip v2.0.0.zip -d .
# This will extract the theme file into the `poole-2.0.0` folder. If you want
# to rename this, run the command below:
$ mv poole-2.0.0 new-folder-name
```

Now, `cd` to our new folder and open the `_config.yml` file with our favourite editor. There are a few configuration settings that you will need to change, here are some of them:

First, you will need to remove `relative_permalinks: true` from the config.

Then, in the 'Setup' section, change the following settings.

```yaml
title:               "{your site title}"
tagline:             "{your site tagline}"
url:                 https://tilde.town
baseurl:             "/~username"
```

The `baseurl` config is actually very important! Read more about what it does [here][jekyll-baseurl].

And finally, modify the 'About/Contact' section with your own contact details.

## Generating your Jekyll site

(**WARNING:** This will overwrite your current tilde site, so make sure you have it backed up before you proceed!)

Before we start, run `jekyll build` from our Jekyll directory to make sure the Jekyll site is generated correctly. If no errors pop up, we can now publish our shiny new tilde site!

We will now create our deploy script. From your Jekyll directory, run the following command:

```bash
$ mkdir tasks
$ touch tasks/deploy.sh
$ chmod 775 tasks/deploy.sh
```

Next, open the newly created file with your favourite text editor and add the following:

```bash
#!/bin/bash
#
# Script to perform a Jekyll deploy to your tilde URL.
#

JEKYLL_DEST="$HOME/public_html"

echo -e "Building Jekyll site to ${JEKYLL_DEST}..."
jekyll build -d $JEKYLL_DEST

# Test if Jekyll build is successful
RESULT_JEKYLL=$?
if [ $RESULT_JEKYLL -ne 0 ]; then
  # Exit if build failed
  echo -e "\nDeployment failed: Jekyll build failed."
  exit 1
fi

echo -e "\nJekyll build successful."
```

And now, if we want to deploy our new Jekyll website, just run the following command from within your Jekyll directory:

```bash
$ tasks/deploy.sh
```

If the script succeeds, that means you can go to your tilde page and see your new page! (If the CSS seems messed up, you can `Ctrl+F5` refresh it.)

## Writing posts, pages and more

Now that we have our own Jekyll website running, it's time to write our new post. Navigate to the `_posts` directory and take a quick look at the example posts, then remove them.

Now, create a Markdown file to get started with your own post. The naming format is *always* `yyyy-mm-dd-post-name.md`, and the standard format for the post file goes like this:

```
---
category: blog    # this is optional
layout: post
title: "Post title"
---

Write your post down here, in markdown.
```

If we generate our site now, we'll see that the posts are generated with a prettified permalink (`/yyyy/mm/dd/post-name/`).

For custom pages, we can simply create a file named `page-name.md` with the following header:

```
---
layout: page
title: "Page title"
---

Write your page content down here, in markdown.
```

The page will be generated with a permalink of `/page-name/`.

Aside from all the stuff mentioned here, Jekyll has many other features, including collections, categories, syntax highlighting (for code), and many more. You can explore through all the available features by reading through [the official docs][jekyll-docs].

---

I hope this guide has been helpful! Feel free to mail me through alpine if you need any help, or you can view the source code of my Jekyll site [here][resi-jekyll].

*~resir014*

[jekyll]: https://jekyllrb.com/
[poole]: http://getpoole.com/
[jekyll-baseurl]: https://byparker.com/blog/2014/clearing-up-confusion-around-baseurl/
[jekyll-docs]: https://jekyllrb.com/docs/home/
[resi-jekyll]: https://github.com/resir014/resir014-tilde