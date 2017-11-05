## Disable Adobe Updates

This should disable auto-updates for Adobe Application Manager based apps as well as Creative Cloud based apps.  Specifically with the Creative Cloud menu-bar app, it removes the **Apps** panel as well as making sure a non-admin user cant update.

This is a set of pkginfo and dmg files to be used with munki.  You may need to edit the pkginfo file for your use.  I have deployed this as an `update_for` certain Adobe packages.

## Alternate Method

A better potential method can be found [here](https://github.com/sphen13/munki-scripts/tree/master/outset/outset-DisableAdobeUpdates) and utilizes [outset](https://github.com/chilcote/outset).

#### Reference

https://helpx.adobe.com/enterprise/package/help/customize-creative-cloud-app.html

https://helpx.adobe.com/creative-suite/kb/disable-auto-updates-application-manager.html