#!/bin/bash

# find and open any manifest that does not have exactly one occurrence of "production" in it.  useful to find manifests that have production nested.

grep -c production /Volumes/Gruntwork-MunkiRepo/manifests/[[:upper:]]* | grep -v 1 | cut -d":" -f1 | xargs open