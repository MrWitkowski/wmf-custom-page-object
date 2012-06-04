# Welcome

Welcome to the Wikimedia Foundation custom page object demo.

This is a suite of automated tests written in Cucumber that run on [the Wikimedia beta deployment cluster](http://deployment.wikimedia.beta.wmflabs.org/wiki/Main_Page).

At this stage, the edit features are disabled, as running these will be classed as vandalism which will result in your account being permanently blocked on the beta site (this is being rectified).

## Prerequisites
* install bundler
* install RVM if you are on Mac OSX or Linux
* create a beta.yml file in lib/config using the template provided with your wikimedia beta credentials (this will NOT be stored in Git)

## Installation
* bundle #to install bundler
* rake #to run the cucumber features