## Solarwinds RMM - GruntWork _(Script Checks)_

Designed to be used as DSC or 24/7 script checks in RMM.  Mostly workarounds :/

### purge_sus.sh

if we are running less than 10.12.6 and have not already run this script previously, fix permissions on /tmp and purge sus cache.

This is the combat an issue getting 10.12.6 updates to run successfully.

### server_check.sh

Comparison check between .agentcontext.cfg and whitelabel.plist