## Solarwinds RMM - GruntWork _(Script Checks)_

Designed to be used as DSC or 24/7 script checks in RMM.  Mostly workarounds :/

### block_root_accunt_login.sh

Patches security flaw in 10.13 which allows any user to login as root with no password.  This is designed to run as a 24x7 RMM script check.  It will ensure that the root user has a valid password set and that its ability to login is disabled.

This does not have to be specific to RMM.

## purge_sus.sh

if we are running less than 10.12.6 and have not already run this script previously, fix permissions on /tmp and purge sus cache.

This is the combat an issue getting 10.12.6 updates to run successfully.

### server_check.sh

Comparison check between .agentcontext.cfg and whitelabel.plist
