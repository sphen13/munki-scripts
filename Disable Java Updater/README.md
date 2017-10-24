# Disable Java Updater

Package that disables the Java Updater for Java 7 and 8

There is an associated outset package that also makes sure that any sponsored crap is not offered to the user.  I couldn't think of a clean way to get that in this same package as it needs to be in the user space - but if you deploy both you should be good to go.  You could link the two packages by `reqiures` or `update_for` in munki.  The [outset-ondemand-JavaSponsors](https://github.com/sphen13/munki-scripts/tree/master/outset/outset-ondemand-JavaSponsors) package can be found [here](https://github.com/sphen13/munki-scripts/tree/master/outset/outset-ondemand-JavaSponsors)

## How to Build

This package utilizes [munkipkg](https://github.com/munki/munki-pkg).

`munkipkg path/to/package_project_directory`

Causes munkipkg to build the package defined in package_project_directory. The built package is created in a build/ directory inside the project directory.

## Please Note

This has been tested on 10.12.6 and Java 8 Update 144

## Mentions

Props to @foigus for these two posts:
https://foigus.wordpress.com/2015/02/20/managing-java-7-and-8-updates/
https://foigus.wordpress.com/2015/03/15/disabling-java-8-sponsor-offer-installation/