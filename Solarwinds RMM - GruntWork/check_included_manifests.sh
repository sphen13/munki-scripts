#!/bin/bash

# loop through manifests and check for existence of included_manifests

MANIFESTS=/Volumes/Gruntwork-MunkiRepo/manifests/[[:upper:]]*
for f in $MANIFESTS
do
	included_manifest=`/usr/libexec/PlistBuddy  -c "Print :included_manifests:0" "$f" 2>/dev/null`
	if [ -z "$included_manifest" ]; then
		echo "\"$f\" does not have any included_manifests"
		open "$f"
	else
		if [ ! -e "/Volumes/Gruntwork-MunkiRepo/manifests/$included_manifest" ]; then
			echo "included_manifest \"$included_manifest\" does not exist which is references in \"$f\""
			open "$f"
		fi
	fi
done