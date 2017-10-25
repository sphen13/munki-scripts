# Outset: Disable Java Sponsors (Login-Once, OnDemand)

Outset package that disables sponsored offerings from Oracle's Java.  It is designed to run once per user yet will also be triggered on demand for any currently logged in user so the results are immediate.

This is meant to also work with my [Disable Java Updater](https://github.com/sphen13/munki-scripts/tree/master/Disable%20Java%20Updater) package.  You may want to link them by `requires` or `update_for` in munki.  This specific preference needs to be set in the user-space so needs something like [outset](https://github.com/chilcote/outset). 

## How to Build

All you really need to do is to change into the directory and `make pkg`:

```
$ cd ./outset-ondemand-JavaSponsors
$ make pkg
```

More details can be attained from the [outset wiki](https://github.com/chilcote/outset/wiki/Customize#package-your-scripts)

## Please Note

This has been tested on 10.12.6 and Java 8 Update 144