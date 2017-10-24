# Kill ParentalControls

This could be terrible but I have been pulling my hair out trying to figure out what the heck is going on with `parentalcontrolsd`.  This total hack (**use at own risk!!**) just kills `parentalcontrolsd` periodically.  You can customize the timing.  I am taking a step further and also purging the ParentalControls settings folder.

Really - you may not want to use this in production...

## How to Build

This package utilizes [munkipkg](https://github.com/munki/munki-pkg).

`munkipkg path/to/package_project_directory`

Causes munkipkg to build the package defined in package_project_directory. The built package is created in a build/ directory inside the project directory.

## Please Note

Dont judge me. :)
