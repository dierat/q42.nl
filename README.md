# Q42.nl runs on Meteor!

We've published the source code to q42.nl and q42.com here for your perusal.

If you find anything on our site that you feel needs fixing, be it code, spelling or anything else,
don't hesitate to send us a pull request or create an issue. We maintain the site ourselves with the same workflow.

# Getting the damn thing to run
Sounds like it'll be a royal pain in the butt ey? Guess again amigo.

### Fork and checkout this project
The hard bit since the repo is around ~220MB

	git clone https://github.com/[YOURUSERNAME]/q42.nl.git

### Install Meteor

On Mac or Linux, run this:

	curl https://install.meteor.com | /bin/sh

On Windows, just go to http://meteor.com/install and download the Windows installer!

### Add settings you need

Create a `config/settings.json` file containing the correct Tumblr and Kadira account information:

  {
    "TUMBLR_KEY": "myTumblrKey",
		"kadira": {
			"appId": "myKadiraAppId",
			"appSecret": "myKadiraAppSecret"
		}
  }

The Tumblr key is required for the blog to not explode (even though you won't actually be able to see any posts without our real API key). If you misconfigure Kadira, you'll just get console errors.

### Set up the Slack chat integration

In order to get this working you need to call a Meteor method named `setupChatConfig` and pass it your incoming and outgoing webhook tokens from Slack. Or you can not do this, and then nothing will change except that the chat won't work.

### Set up the CDN

We serve assets from a Google Cloud Storage bucket. To set this up on your machine you're going to need the `gsutil` command line utility. Info on how to get this running and other details you might be interested in are found here:

https://developers.google.com/storage/docs/gsutil_install

The `gsutil` command is used by the `deploy.sh` script when deploying the site. It will publish all the assets to the CDN for you automatically! Unfortunately, to be able to do this you need to have write access to the bucket.

As a result of serving assets from the CDN, Meteor's `/public` folder is only useful for local development. All assets are referenced via `http://static.q42.nl` rather than something like `<img src="/mypicture.jpg">`! To get things working nicely in local dev, you'll need to add `http://static.q42.nl` to your `hosts` file:

	127.0.0.1 static.q42.nl

But since Meteor runs on port 3000, this won't work, so we'll have to run Meteor on port 80 too (see below).

### cd into checkout and run meteor

	cd q42.nl
	sudo ./run.sh

# Deploying

First you need the following prerequisites:

 - Git Flow, which you can get here: https://github.com/nvie/gitflow/wiki/Installation
 - Access to the two environments on http://scalingo.com (q42nlsite and q42comsite). Ask rahul or lukas.
 - Access to GCS bucket static.q42.nl at https://console.developers.google.com/project/504623166341/storage/browser. Ask rahul or lukas.

Then, add the two Scalingo Git Remotes:

    git remote add scalingo-nl git@scalingo.com:q42nlsite.git
    git remote add scalingo-en git@scalingo.com:q42comsite.git

Since you need to deploy to two separate sites (q42.nl and q42.com), there's a script which will take care of both commands. Just run:

	./deploy.sh

# Contributing

Content for the site is located in the /views folder as regular .html files, so if you want to edit some content, just
navigate to that file and edit it! A really fast way to clean up spelling mistakes and similar small problems is to just load the repository on Github and use its built-in editor to edit files. Github will automatically fork the project for you and submit a pull request. Yay!

# Credits

We use the reblog icon by Yo Szczepanska from the Noun Project: http://thenounproject.com/term/reblog/7116/ (CC BY 3.0).

# License?

There is no license. This is the code for our website, copyright Q42. You can browse the source and learn from our mishaps,
but please don't re-use the code elsewhere or redistribute it.
