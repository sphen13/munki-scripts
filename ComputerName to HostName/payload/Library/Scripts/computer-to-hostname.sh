#!/bin/bash

new_name=`networksetup -getcomputername | sed -e "s/[+=., \"'()]//g"`

echo "Setting Local DNS Name to: $new_name"
scutil --set LocalHostName $new_name
echo "Setting HostName Name to: $new_name"
scutil --set HostName $new_name

exit 0
