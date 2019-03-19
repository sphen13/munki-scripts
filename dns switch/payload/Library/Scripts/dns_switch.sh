#!/bin/bash
##
## Check current dns against ManagedInstalls and see if we should use local dns for proxy or not
## ManagedInstalls key is localDNSProxy for BOTH dns and proxy
##

localDNSProxy=`defaults read /Library/Preferences/ManagedInstalls localDNSProxy 2>/dev/null`

if [[ -z ${localDNSProxy} ]]; then
	# no action
	exit 0
fi

repoServer=`defaults read /Library/Preferences/ManagedInstalls SoftwareRepoURL | cut -d/ -f3 2>/dev/null`
networkInterface=`route get google.com | grep interface | cut -d: -f2 2>/dev/null`

if [[ -z ${networkInterface} ]]; then
	# no action
	exit 0
else
	networkService=`/usr/sbin/networksetup -listnetworkserviceorder | grep ${networkInterface} | cut -d: -f2 | awk -F, 'BEGIN{FS=OFS=","}NF{NF-=1} $1=$1' | awk '{$1=$1};1' 2>/dev/null`
fi

if [[ -z ${networkService} ]]; then
	# no action
	exit 0
fi

# check if we can resolve using dns server
result=`dig @${localDNSProxy} +short ${repoServer} 2>/dev/null`
if [ "${result}" != "${localDNSProxy}" ]; then
	# dns does not match lets make sure we clear any dns setting
	/usr/sbin/networksetup -setdnsservers "${networkService}" Empty
	exit 0
else
	# lets set our dns server
	/usr/sbin/networksetup -setdnsservers "${networkService}" ${localDNSProxy} 8.8.8.8
fi

exit 0
