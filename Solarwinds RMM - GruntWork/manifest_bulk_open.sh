#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    open "/Volumes/Gruntwork-MunkiRepo/manifests/$line"
done < "$1"
