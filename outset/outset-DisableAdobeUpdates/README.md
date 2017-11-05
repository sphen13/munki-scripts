## (Outset) Disable Adobe Updates

Each time a user logs onto the system this will make sure auto-updates for Adobe Application Manager based apps as well as Creative Cloud based apps are disabled.  Specifically with the Creative Cloud menu-bar app, it removes the **Apps** panel as well as making sure a non-admin user cant update.

The reason I have chosen this method over a traditional munki/copy_from_dmg approach, is that I found that sometimes the first login after a fresh adobe install, the update settings were not in place and could trigger updates immediately.  The other approach would have to wait until the next munki check-in to fix.  If we just make sure all is set on every login it should be more reliable.

This package utilizes [outset](https://github.com/chilcote/outset) and will not do anything unless that is also installed.

I have deployed this with munki and use the `requires` key in the associated pkginfo file.
```
<key>requires</key>
<array>
	<string>outset</string>
</array>
```

## How to Build

This package utilizes [outset](https://github.com/chilcote/outset).

```
cd path/to/outset_project_directory
make pkg
```

Causes a package to be built in package_project_directory.  You may then distribute.

## Alternate Method

Another method can be found [here](https://github.com/sphen13/munki-scripts/tree/master/Disable%20Adobe%20Updates) which doesn't require anything other than munki.  It is not as rock solid in my opinion.

#### Reference

https://helpx.adobe.com/enterprise/package/help/customize-creative-cloud-app.html

https://helpx.adobe.com/creative-suite/kb/disable-auto-updates-application-manager.html
