# Zoom Settings

Package to manually remove Solarwinds RMM / Mac-MSP GruntWork / Munki / Watchman Monitoring

Although we have an automated way to trigger all these tasks it is sometimes necessary to remove all these components manually.  This is the sledgehammer.

This contains a LaunchDaemon and script that performs all the needed tasks.  The LaunchDameon uses the key `AbandonProcessGroup` so that the script may run independently of the parent launchd process and it can even remove itself at the end of the run.

## How to Build

This package utilizes [munkipkg](https://github.com/munki/munki-pkg).

`munkipkg path/to/package_project_directory`

Causes munkipkg to build the package defined in package_project_directory. The built package is created in a build/ directory inside the project directory.

## Please Note

This is specific to our needs yet may be able to be used as-is in someone else's scenario.