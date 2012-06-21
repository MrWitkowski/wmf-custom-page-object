# Welcome

Welcome to the Wikimedia Foundation custom page object demo.

This is a suite of automated tests written in Cucumber that run on [the Wikimedia beta deployment cluster](http://deployment.wikimedia.beta.wmflabs.org/wiki/Main_Page).

The tests only edit the logged in user's user page on Wikipedia to minimise chance of being classified as a vandal.

## Prerequisites
* install bundler
* install RVM if you are on Mac OSX or Linux
* create a beta.yml file in lib/config using the template provided with your wikimedia beta credentials (this will NOT be stored in Git)

## Installation
* bundle #to install bundler
* rake #to run the rspec specs
* rake features to run the cucumber features