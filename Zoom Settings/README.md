## Zoom Settngs

One of our scripts that helps you use a shared computer resource for Zoom meetings.

This LaunchAgent and associated script resets the Zoom settings to be fresh when the app has been quit.  This effectively logs the user out for the next launch.

## Please Note

Currently this is a quick implementation which is hardcoded to a certain username.  The username *source* should be changed for your specific use-case.  This also has a specific *zoomus.db* file which is specific to a SSO domain and needs to be changed.

This could be adapted easily to run for all users and specify the target user with a plist

the *zoomus.db* file is sqlite and intelligence could be built in to just interact via sqlite instead of re-writing the file.