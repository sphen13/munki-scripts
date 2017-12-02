# munki proxy-check

This is a munki preflight script. When installed, each time munki is run, it will detect a local munki proxy via bonjour and change the `SoftwareRepoURL` key in `ManagedInstalls.plist` to point to the discovered local repo.  Subsequent runs if a proxy is not detected or the proxy fails to pass a test we will revert back to the previously used `SoftwareRepoURL`.

Also added apple sus caching as well.  It do the same behavior as above for the `CatalogURL` key of `com.apple.SoftwareUpdate.plist`.  It tests to see if the default catalog returns a valid response from the proxy.  If anything fails it will keep the current setting.

This has been designed to work with a [sphen/munki-proxy](https://hub.docker.com/r/sphen/munki-proxy/) docker container that has mDNS enabled.

## How to Build

This package utilizes [munkipkg](https://github.com/munki/munki-pkg).

`munkipkg path/to/package_project_directory`

Causes munkipkg to build the package defined in package_project_directory. The built package is created in a build/ directory inside the project directory.

## Please Note

This is a very simple script and designed for a special use case scenario.  There is not any security thown into this currently and you could very well be exposing yourself to being hijacked to a different munki server if you use this.  Please heed this as a warning. :)
