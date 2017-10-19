# Zoom Inactivity Quit

One of our scripts that helps you use a shared computer resource for Zoom meetings.

This LaunchAgent and associated script quits the Zoom (zoom.us) application if there is no meeting current in session and user input has been idle for over 15 minutes.

## How to Build

This package utilizes [munkipkg](https://github.com/munki/munki-pkg).

`munkipkg path/to/package_project_directory`

Causes munkipkg to build the package defined in package_project_directory. The built package is created in a build/ directory inside the project directory.

## Please Note

Currently this is a quick implementation which is hardcoded to a certain username.  The username *source* should be changed for your specific use-case.

This could be adapted easily to run for all users and specify the target user with a plist
